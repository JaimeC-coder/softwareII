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
                    'orcomfecha' => date('Y-m-d'),
                    'orcomhora' => date('H:i:s'),
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
        return view('compras.show', compact('compra', 'detalleCompra'));
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
}
