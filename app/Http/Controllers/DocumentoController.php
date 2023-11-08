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
        $venta = Venta::all();
        return view('dashboard.ventas', compact('venta'));
    }




    public function todo()
    {
        $monthNames = [
            'January', 'February', 'March', 'April', 'May', 'June',
            'July', 'August', 'September', 'October', 'November', 'December'
        ];

        $currentMonth = now()->month;

        $monthlyData = DB::table(DB::raw('ventas AS v, compras AS c'))
            ->select(
                DB::raw('MONTH(NOW()) AS mes'),
                DB::raw('IFNULL(SUM(v.cantidad), 0) AS cantidad_ventas'),
                DB::raw('IFNULL(SUM(c.cantidad), 0) AS cantidad_compras')
            )
            ->where(DB::raw('MONTH(v.venfecha)'), '<=', $currentMonth)
            ->where(DB::raw('MONTH(c.orcomfecha)'), '<=', $currentMonth)
            ->groupBy('mes')
            ->orderBy('mes')
            ->get();

        $mergedData = collect($monthNames)->map(function ($month, $index) use ($monthlyData) {
            $data = $monthlyData->firstWhere('mes', $index + 1);
            return [
                'mes' => $month,
                'cantidad_ventas' => $data ? $data->cantidad_ventas : 0,
                'cantidad_compras' => $data ? $data->cantidad_compras : 0,
            ];
        });

        return $mergedData;
    }

 /**
     * Remove the specified resource from storage.
     */
    public function destroy(Documento $documento)
    {
        //
    }


}
