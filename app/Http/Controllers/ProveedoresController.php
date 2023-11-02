<?php

namespace App\Http\Controllers;

use App\Models\Proveedores;
use Illuminate\Http\Request;

class ProveedoresController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $proveedores = Proveedores::all();
        return view('proveedor.index', compact('proveedores'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $proveedores = new Proveedores();
        return view('proveedor.create', compact('proveedores'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        $proveedor = Proveedores::create([
            'provdoc' => $request->provdoc,
            'provtelefono' => $request->provtelefono,
            'provcorreo' => $request->provcorreo,
            'provdireccion' => $request->provdireccion,
            'provrazonsocial' => $request->provrazonsocial
        ]);
        return redirect()->route('proveedores.index')->with('success', 'Proveedor creado exitosamente');
    }

    /**
     * Display the specified resource.
     */
    public function show(Proveedores $proveedores)
    {
        //
        return view('proveedor.show', compact('proveedores'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Proveedores $proveedores)
    {
        //
        return view('proveedor.edit', compact('proveedores'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Proveedores $proveedores)
    {
        //
        $proveedores->update(
            [
                'provdoc' => $request->provdoc,
                'provtelefono' => $request->provtelefono,
                'provcorreo' => $request->provcorreo,
                'provdireccion' => $request->provdireccion,
                'provrazonsocial' => $request->provrazonsocial
            ]
        );
        return redirect()->route('proveedores.index')->with('success', 'Proveedor actualizado exitosamente');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Proveedores $proveedores)
    {
        //
        $proveedores->delete();
        return redirect()->route('proveedores.index')->with('success', 'Proveedor eliminado exitosamente');
    }
}
