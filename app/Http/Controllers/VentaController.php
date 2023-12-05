<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use App\Models\TipoComprobante;
use App\Models\TipoPago;
use App\Models\Venta;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;
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
        $productos = Producto::whereNotNull('propreciounitario')->select('idProducto', 'pronombre', 'propreciounitario', 'prostock', 'idUnidadmedida')->get();
        $comprobante =  TipoPago::pluck('tpagotipo', 'idTipopago');
        $pago = TipoComprobante::pluck('tcomcomprobante', 'idTipocomprobante');

        return view('ventas.create', compact('venta', 'productos', 'comprobante', 'pago'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //dd($request->all());

        DB::transaction(function () use ($request) {
            $venta = Venta::create(
                [
                    'venfecha' =>  $request->venfecha,
                    'vendocumentocliente' => $request->vendocumentocliente,
                    'venhora' => $request->venhora,
                    'venestado' => 'pagado',
                    'venmonto' => $request->venmonto,
                    'venimpuesto' => $request->venimpuesto,
                    'ventotalneto' => $request->ventotalneto,
                    'venobservacion' => $request->venobservacion == null ? 'Sin observación' : $request->venobservacion,
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
        $detalleventa = VentaDetalle::where('idVenta', $venta->idVenta)->get();
        return view('ventas.show', compact('venta', 'detalleventa'));
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

    public function pdf(Venta $venta)
    {
        $detalleventa = VentaDetalle::where('idVenta', $venta->idVenta)->get();
        $pdf = Pdf::loadView('ventas.pdf', compact('venta', 'detalleventa'));
        //darle tamaño a la hoja
        
        return $pdf->download('venta.pdf');
    }

    public function ventaxfechas(Request $request)
    {
        if (is_null($request->fecha1)) {
            $ventas = Venta::all();
            $mensaje =  'No estableció fecha 1';
        } elseif (is_null($request->fecha2)) {
            $ventas = Venta::Where('venfecha', $request->fecha1)->get();
            $mensaje = "";
        } elseif ($request->fecha1 > $request->fecha2) {
            $ventas = Venta::all();
            $mensaje = 'La fecha 1 no puede ser mayor a la fecha 2';
        } else {
            $ventas = Venta::whereBetween('venfecha', [$request->fecha1, $request->fecha2])->get();
            $mensaje = '';
        }

        return view('ventas.index', compact('ventas'))->with('error', $mensaje);
    }

    public function graficafechas(Request $request)
    {
        $labels = [];
        $data = [];
        //mostrar por defecto ventas por mes de este año
        //si no se establece año se va a tomar el año actual
        //el el request se van a traer 3 datos el año , la fecha 1 y la fecha 2
        //si el año es nulo se va a tomar el año actual
        //si la fecha 2 es nula se va a tomar hasta la fecha actual
        //si la fecha 1 es nula no va segir mostrando por meses del año actual
        if (is_null($request->fecha1) and is_null($request->fecha2)) {
            $ventas = Venta::selectRaw('DATE_FORMAT(venfecha, "%M") AS mes, COUNT(*) AS cantidad')
                ->groupBy('mes')
                ->get();
            $mensaje =  'No estableció fecha 1';
        } elseif (is_null($request->fecha2)) {
            $ventas = Venta::selectRaw('DATE_FORMAT(venfecha, "%Y-%m-%d") AS fecha, COUNT(*) AS cantidad_ventas')
                ->where('venfecha', $request->fecha1)
                ->groupBy('fecha')
                ->get();;
            $mensaje = "Fechas desde el 1 de enero hasta el $request->fecha1";
        } elseif ($request->fecha1 > $request->fecha2) {
            $ventas = Venta::selectRaw('DATE_FORMAT(venfecha, "%M") AS nombre_mes, COUNT(*) AS cantidad_ventas')
                ->groupBy('mes')
                ->get();
            $mensaje = 'La fecha 1 no puede ser mayor a la fecha 2';
        } else {
            $ventas = Venta::selectRaw('DATE_FORMAT(venfecha, "%M %Y") AS mes, COUNT(*) AS cantidad_ventas')
                ->whereBetween('venfecha', [$request->fecha1, $request->fecha2])
                ->groupBy('mes')
                ->get();

            $mensaje = '';
        }
        foreach ($ventas as $items) {
            $labels[] = $items->nombre_mes;
            $data[] = $items->cantidad_ventas;
        }

        return response()->json([
            'labels' => $labels,
            'data' => $data,
            'mensaje' => $mensaje,
        ]);
    }

    public function dasboard()
    {
        $venta = Venta::all();
        return view('dashboard.ventas', compact('venta'));
    }




    public function ventas()
    {
        $meses = DB::table('ventas')
            ->selectRaw('meses.nombre AS mes, COUNT(ventas.idVenta) AS cantidad')
            ->rightJoin(
                DB::raw('(
                SELECT 1 AS mes, "January" AS nombre
                UNION SELECT 2, "February"
                UNION SELECT 3, "March"
                UNION SELECT 4, "April"
                UNION SELECT 5, "May"
                UNION SELECT 6, "June"
                UNION SELECT 7, "July"
                UNION SELECT 8, "August"
                UNION SELECT 9, "September"
                UNION SELECT 10, "October"
                UNION SELECT 11, "November"
                UNION SELECT 12, "December"
            ) meses'),
                function ($join) {
                    $join->on('meses.nombre', '=', DB::raw('DATE_FORMAT(ventas.venfecha, "%M")'));
                }
            )
            ->where('meses.mes', '<=', date('m'))
            ->groupBy('meses.nombre')
            ->orderByRaw('MIN(meses.mes)') // Ordenar por el mínimo valor de mes
            ->get();



        $labels = [];
        $data = [];

        foreach ($meses as $mes) {
            $labels[] = $mes->mes;
            $data[] = $mes->cantidad;
        }


        $response = [
            'labels' => $labels,
            'label' => 'Total de ventas hasta la fecha de ' . date('d-m-Y'),
            'data' => $data,
            'fill' => false,
            'borderColor' => '#4bc0c0',
            'tension' => 0.1,

        ];

        return response()->json($response);
    }
}
