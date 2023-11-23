<?php

namespace App\Http\Controllers;

use App\Models\Documento;
use Illuminate\Http\Request;
use App\Models\Venta;
use Illuminate\Support\Facades\DB;


class DocumentoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $documentos = Documento::all();
        return view('documentos.index', compact('documentos'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Documento $documento)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Documento $documento)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Documento $documento)
    {
        //
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
        $documentos = Documento::all();
        return view('dashboard.finansas', compact('documentos'));
    }




    public function finanzas()
    {
        $mesesventas = DB::table('ventas')
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


        $mesescompras = DB::table('compras')
            ->selectRaw('meses.nombre AS mes, COUNT(compras.idOrdencompra) AS cantidad')
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
                    $join->on('meses.nombre', '=', DB::raw('DATE_FORMAT(compras.orcomfecha, "%M")'));
                }
            )
            ->where('meses.mes', '<=', date('m'))
            ->groupBy('meses.nombre')
            ->orderByRaw('MIN(meses.mes)') // Ordenar por el mínimo valor de mes
            ->get();



            $respuesta = [
            'labels' => $mesesventas->pluck('mes'),
            'dataset' => [
                [
                    'label' => 'Ventas',
                    'data' => $mesesventas->pluck('cantidad'),
                    'fill' => false,
                    'borderColor' => '#4bc0c0',
                    'tension' => 0.1,
                ],
                [
                    'label' => 'Compras',
                    'data' => $mesescompras->pluck('cantidad'),
                    'fill' => false,
                    'borderColor' => '#565656',
                    'tension' => 0.1,
                ],
            ]
        ];

        return response()->json($respuesta);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Documento $documento)
    {
        //
    }
}
