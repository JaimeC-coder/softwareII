<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use App\Models\TipoComprobante;
use App\Models\TipoPago;
use App\Models\Venta;
use Illuminate\Support\Facades\DB;
use  Illuminate\Support\Facades\Storage;
use App\Models\DetalleVenta;
use App\Models\TipoDocumento;
use App\Models\VentaDetalle;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VentaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $ventas = Venta::all();
        return view('ventas.index', compact('ventas'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $venta = new Venta();
        $productos = Producto::all();
        $comprobante =  TipoPago::pluck('tpagotipo', 'idTipopago');
        $pago = TipoComprobante::pluck('tcomcomprobante', 'idTipocomprobante');
        return view('ventas.create', compact('venta', 'productos', 'comprobante', 'pago'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        DB::transaction(function () use ($request) {
            $venta = Venta::create(
                [
                    'venfecha' => date('Y-m-d'),
                    'vendocumentocliente' => $request->vendocumentocliente,
                    'venhora' => date('H:i:s'),
                    'venestado' => 'pagado',
                    'venmonto' => $request->venmonto,
                    'venimpuesto' => $request->venimpuesto,
                    'ventotalneto' => $request->ventotalneto,
                    'venobservacion' => $request->venobservacion,
                    'idTipocomprobante' => $request->idTipocomprobante,
                    'idTipopago' => $request->idTipopago,
                    'idEmpleado' => Auth()->user()->empleado->idEmpleado,
                ]
            );
            for ($i = 0; $i < sizeof($request->list_productos); $i++) {
                VentaDetalle::create([
                    'idVenta' => $venta->idVenta,
                    'idProducto' => $request->list_productos[$i],
                    'dvcantidad' => $request->list_quantity[$i],
                    'dvpreciounitario' => $request->list_precios[$i],
                ]);
                $producto = Producto::find($request->list_productos[$i]);
                $producto->update(
                    [
                        'prostock' => $producto->prostock - $request->list_quantity[$i],
                    ]
                );
            }
            //busca el nombre del modelo en la tabla de tipo de documentos
            //quiero guardar el tipo de este modelo en la tabla de documentos
            $tipoDocumento = TipoDocumento::where('tidDocumento', 'Venta')->first();

            $venta->documentos()->create([
                'idTipoDocumento' => $tipoDocumento->idTipoDocumento,
                'docnumero' => $venta->idVenta,
                'docmonto' => $venta->ventotalneto,
                'docsimbolo' => "+",
            ]);
        });

        return redirect()->route('ventas.index')->with('success', 'Venta registrada correctamente');
    }

    /**
     * Display the specified resource.
     */
    public function show(Venta $venta)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Venta $venta)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Venta $venta)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Venta $venta)
    {
        //
    }
}
