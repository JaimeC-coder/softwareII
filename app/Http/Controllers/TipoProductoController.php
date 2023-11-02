<?php

namespace App\Http\Controllers;

use App\Models\TipoProducto;
use Illuminate\Http\Request;
use Termwind\Components\Dd;

class TipoProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $tipoProductos = TipoProducto::all();
        return view('tipoProducto.index', compact('tipoProductos'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $tipoProducto = new TipoProducto();
        return view('tipoProducto.create', compact('tipoProducto'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        TipoProducto::create([
            'tpronombre' => $request->tpronombre

        ]);
        return redirect()->route('tipoProductos.index')->with('success', 'Tipo de producto creado');
    }

    /**
     * Display the specified resource.
     */
    public function show(TipoProducto $tipoProducto)
    {
        //
        return view('tipoProducto.show', compact('tipoProducto'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(TipoProducto $tipoProducto)
    {
        //
        return view('tipoProducto.edit', compact('tipoProducto'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, TipoProducto $tipoProducto)
    {
        //
       
        $tipoProducto->update([
            'tpronombre' => $request->tpronombre
        ]);
        return redirect()->route('tipoProductos.index')->with('success', 'Tipo de producto actualizado');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TipoProducto $tipoProducto)
    {
        //
        $tipoProducto->delete();
        return redirect()->route('tipoProductos.index')->with('success', 'Tipo de producto eliminado');
    }
}
