<?php

namespace App\Http\Controllers;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Http\Request;

class RolController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $roles = Role::all();
        return view('roles.index', compact('roles'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $rol = new Role();
        $permissions = Permission::all();
        return view('roles.create', compact('rol','permissions'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        Role::create([
            'name' => $request->nombre,
        ]);
        return redirect()->route('roles.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Role $role)
    {
        //
        return view('roles.show', compact('role'));

    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Role $role)
    {
        //
        return view('roles.edit', compact('role'));

    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,Role $roles)
    {
        //
        $roles->update([
            'name' => $request->nombre,
        ]);
        return redirect()->route('roles.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Role $role)
    {
        //
        $role->delete();

        return redirect()->route('roles.index');
    }

}
