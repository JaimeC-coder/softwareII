<?php

namespace App\Http\Controllers;

use App\Models\Capacitacion;
use Illuminate\Http\Request;
use App\Models\Departamento;
use App\Models\Empleado;
use App\Models\Asistencia;
use Illuminate\Support\Facades\DB;
class CapacitacionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $capacitaciones = Capacitacion::all();
        return view('capacitaciones.index', compact('capacitaciones'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $area = Departamento::pluck('depnombre', 'idDepartamento');
        $capacitacion = new Capacitacion();
        return view('capacitaciones.create', compact('capacitacion', 'area'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        $empleado = Empleado::find(Auth()->user()->idEmpleado);
        $empleadosIds = Empleado::where('idDepartamento',$request->caparea)->select('idEmpleado','empnombres','empapellidop','empapellidom','empdni')->get() ;

        $departameno = Departamento::where('idDepartamento', $request->caparea)->pluck('depnombre');

      //  DB::transaction(function () use ($request, $empleado, $empleadosIds, $departameno) {
        DB::transaction(function () use ($request, $empleadosIds) {
       $capacitacion= Capacitacion::create([
            'capfechainicio' => $request->capfechainicio,
            'capfechafin' => $request->capfechafin,
            'capcapacitador' => $request->capcapacitador,
            'idDepartamento' => $request->caparea,
        ]);
        // $asistencias = [];
        foreach ($empleadosIds as $empleadoId) {
            Asistencia::create([
                'idEmpleado'  => $empleadoId->idEmpleado,
                'idCapacitacion' => $capacitacion->idCapacitacion,
                'idDepartamento' => $request->caparea,

            ]);

            // $asistencias[] = [
            //     'idEmpleado',
            //     'nombre_completo' => $empleadoId->empnombres ." ".$empleadoId->empapellidop." ".$empleadoId->empapellidom,
            //     'dni' => $empleadoId->empdni,
            // ];
        }
    });
    return redirect()->route('capacitaciones.index')->with('success', 'Capacitacion creada correctamente');
    }

    /**
     * Display the specified resource.
     */
    public function show(Capacitacion $capacitacion)
    {
        //

        $asistencia = Asistencia::Where('idCapacitacion', $capacitacion->idCapacitacion)->select('idEmpleado', 'asistio', 'justificacion')->get();
        //return $asistencia;
        return view('capacitaciones.show', compact('capacitacion', 'asistencia'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Capacitacion $capacitacion)
    {
        //
        $area = Departamento::pluck('depnombre', 'idDepartamento');
        return view('capacitaciones.edit', compact('capacitacion', 'area'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Capacitacion $capacitacion)
    {
        //
        //request()->validate(Capacitacion::$rules);

        $capacitacion->update($request->all());

        return redirect()->route('capacitacions.index')
            ->with('success', 'Capacitacion updated successfully');

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Capacitacion $capacitacion)
    {
        //
        $capacitacion->delete();

        return redirect()->route('capacitaciones.index')
        ->with('success', 'Capacitacion deleted successfully');
    }

    public function asistencia(Capacitacion $capacitacion)
    {

        $asistencia = $capacitacion->asistencias;
        if ($capacitacion->capfechainicio >= date('Y-m-d') || $capacitacion->capfechafin >= date('Y-m-d')) {
            return view('asistencias.edit', compact('asistencia', 'capacitacion'));
        } else {
            return redirect()->route('capacitaciones.index')
                ->with('success', 'Capacitacion no disponible');
        }

    //     $asistencia = $capacitacion->asistencias;
    //  if ($capacitacion->solicitud->solestado == 'pendiente') {
    //     return redirect()->route('capacitacions.index')
    //     ->with('success', 'Capacitacion no esta aprobada');
    //  } else {
    //     if ($capacitacion->capfechainicio >= date('Y-m-d') || $capacitacion->capfechafin >= date('Y-m-d')) {
    //         return view('asistencia.edit', compact('asistencia', 'capacitacion'));
    //     } else {
    //         return redirect()->route('capacitacions.index')
    //             ->with('success', 'Capacitacion no disponible');
    //     }
    //  }


        // return $asistencia;

    }
    public function guardar(Request $request)
    {

        foreach ($request->asistio as $asistenciaId => $asistio) {
            $asistencia = Asistencia::find($asistenciaId);
            $asistencia->update([
                'asistio' => $asistio,

                'justificacion' => $request->justificante[$asistenciaId]
            ]);
        }
        return redirect()->route('capacitaciones.index')
            ->with('success', 'Capacitacion updated successfully');
    }
}
