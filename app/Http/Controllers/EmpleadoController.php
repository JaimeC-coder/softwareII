<?php

namespace App\Http\Controllers;

use App\Models\Empleado;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\Departamento;
use App\Models\User;
use Spatie\Permission\Models\Role;


class EmpleadoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $empleados = Empleado::all();
        return view('empleados.index', compact('empleados'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $empleado = new Empleado();
        $user = new User();
        $departamentos = Departamento::pluck('depnombre', 'idDepartamento');
        $roles = Role::all();

        return view('empleados.create', compact('empleado', 'departamentos', 'roles', 'user'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $user = User::create([
            'name' => $request->empnombres." ". $request->empapellidop,
            'email' => $request->usuemail,
            'password' =>Hash::make($request->usucontra),
        ])->syncRoles($request->rols);
         Empleado::create([
            'empnombres' => $request->empnombres,
            'empapellidop' => $request->empapellidop,
            'empapellidom' => $request->empapellidom,
            'empdni' => $request->empdni,
            'empdireccion' => $request->empdireccion,
            'emptelefono' => $request->emptelefono,
            'idDepartamento' => $request->idDepartamento,
            'idUser' => $user->idUser   ,
         ]);

        return redirect()->route('empleados.index')->with('success', 'Empleado creado con éxito');
    }

    /**
     * Display the specified resource.
     */
    public function show(Empleado $empleado)
    {

        return view('empleados.show', compact('empleado'));

    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Empleado $empleado)
    {
        $departamentos = Departamento::pluck('depnombre', 'idDepartamento');
        $roles = Role::all();
        $user = User::find($empleado->idEmpleado);
        return view('empleados.edit', compact('empleado', 'departamentos', 'roles', 'user'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Empleado $empleado)
    {
        //
         $empleado->user->update([
            'name' => $request->empnombres." ". $request->empapellidop,
            'email' => $request->usuemail,
            'password' =>($request->usucontra == "Ingrese nueva contraseña" or $request->usucontra == "" ) ? $empleado->user->password : Hash::make($request->usucontra),
         ]);
         //actualizar los roles
            $empleado->user->syncRoles($request->rols);

         $empleado->update([
            'empnombres' => $request->empnombres,
            'empapellidop' => $request->empapellidop,
            'empapellidom' => $request->empapellidom,
            'empdni' => $request->empdni,
            'empdireccion' => $request->empdireccion,
            'emptelefono' => $request->emptelefono,
            'idDepartamento' => $request->idDepartamento,
         ]);

        return redirect()->route('empleados.index')->with('success', 'Empleado actualizado con éxito');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Empleado $empleado)
    {
        //
        $empleado->delete();
        $user = User::find($empleado->idEmpleado);
        $user->roles()->detach();
        $user->delete();
        return redirect()->route('empleados.index')
            ->with('success', 'Empleado deleted successfully');


    }
}
