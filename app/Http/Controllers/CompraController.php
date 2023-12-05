<?php

namespace App\Http\Controllers;

use App\Models\Compra;
use App\Models\CompraDetalle;
use App\Models\Producto;
use App\Models\Proveedores;
use App\Models\TipoComprobante;
use App\Models\TipoPago;
use Illuminate\Support\Facades\DB;
use App\Models\TipoDocumento;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class CompraController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $compras = Compra::all();
        return view('compras.index', compact('compras'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $tipoComprobante = TipoComprobante::pluck('tcomcomprobante', 'idTipocomprobante');
        $tipoPago = TipoPago::pluck('tpagotipo', 'idTipopago');
        $proveedor = Proveedores::pluck('provrazonsocial', 'idProveedor');
        $productos = Producto::all();
        $compra = new Compra();

        return view('compras.create', compact('tipoComprobante', 'tipoPago', 'proveedor', 'productos', 'compra'));

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        DB::transaction(function () use ($request) {
            $compra = Compra::create(
                [
                    'orcomfecha' => $request->orcomfecha,
                    'orcomhora' => $request->orcomhora,
                    'orcomdescripcion' => $request->orcomdescripcion,
                    'orcomtotal' => $request->orcomtotal,
                    'orcomestado' => 'pagado',
                    'idProveedor' => $request->idProveedor,//
                    'idEmpleado' =>   Auth()->user()->empleado->idEmpleado,

                    'idTipocomprobante' => $request->idTipocomprobante,
                    'idTipopago' => $request->idTipopago,
                ]
            );
            for ($i = 0; $i < sizeof($request->list_productos); $i++) {
                CompraDetalle::create([
                    'idOrdencompra' => $compra->idOrdencompra,
                    'idProducto' => $request->list_productos[$i],
                    'dcomcantidad' => $request->list_quantity[$i],
                    //'dcomunitario'=>$request->list_precios[$i],
                ]);
            }
            // $compratotal = DetalleCompra::Where('idOrdencompra', $ordencompra->idOrdencompra)->get();
            // $url = $this->pdf($ordencompra, $compratotal);

            $tipoDocumento = TipoDocumento::where('tidDocumento', 'Compra')->first();

            $compra->documentos()->create([
                'idTipoDocumento' => $tipoDocumento->idTipoDocumento,
                'docnumero' => $compra->idOrdencompra,
                'docmonto' => $compra->orcomtotal,
                'docsimbolo' => "-",
            ]);


        });
        return redirect()->route('compras.index')->with('success', 'Compra registrada correctamente');


    }

    /**
     * Display the specified resource.
     */
    public function show(Compra $compra)
    {
        //
        $detalleCompra = CompraDetalle::where('idOrdencompra', $compra->idOrdencompra)->get();
        $ordenCompra = $compra;
        return view('compras.show', compact('ordenCompra', 'detalleCompra'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Compra $compra)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Compra $compra)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Compra $compra)
    {
        //
    }

    public function pdf(Compra $compra)
    {
        $compratotal = CompraDetalle::Where('idOrdencompra', $compra->idOrdencompra)->get();
        $pdf = PDF::loadView('compras.pdf', compact('compra', 'compratotal'));
        return $pdf->download('compra.pdf');
        
    }


    public function dasboard()
    {
        $compra = Compra::all();
        return view('dashboard.compras', compact('compra'));
    }




    public function compras()
    {

        $productos = DB::table('productos')
        ->leftJoin('compra_detalles' ,'productos.idProducto','compra_detalles.idProducto')
        ->select(DB::raw('productos.pronombre as producto'),DB::raw('COALESCE(COUNT(compra_detalles.idProducto), 0) AS cantidad'))
        ->groupBy('productos.pronombre')
        ->get();



        $labels = [];
        $data = [];

        foreach ($productos as $items) {
            $labels[] = $items->producto;
            $data[] = $items->cantidad;
        }


        $response = [
            'labels' => $labels,
            'label'=> 'Total los productos comprados hasta  '. date('d-m-Y'),
            'data' => $data,
            'backgroundColor'=> '#4cc0c1',
            'borderColor'=> '#4bc0c0',
            'borderWidth'=> 1,

        ];

        return response()->json($response);
    }
}
