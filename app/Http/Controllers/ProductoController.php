<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use Illuminate\Http\Request;

class ProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $productos = Producto::all();
        return view('productos.index', compact('productos'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $producto = new Producto();

        return view('productos.create', compact('producto'));

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        Producto::create([
            'pronombre' => $request->pronombre,
            'prodescripcion' => $request->prodescripcion,
            'propreciounitario' => $request->propreciounitario,
            'propreciocompra' => $request->propreciocompra,
            'prostock' => $request->prostock,
            'prostockminimo' => $request->prostockminimo,
            'idTipoproducto' => $request->idTipoproducto,
            'idUnidadmedida' => $request->idUnidadmedida,
        ]);

        return redirect()->route('productos.index')->with('success', 'Producto creado exitosamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Producto $producto)
    {
        //
        return view('productos.show', compact('producto'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Producto $producto)
    {
        //
        return view('productos.edit', compact('producto'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Producto $producto)
    {
        //
        $producto->update([
            'pronombre' => $request->pronombre,
            'prodescripcion' => $request->prodescripcion,
            'propreciounitario' => $request->propreciounitario,
            'propreciocompra' => $request->propreciocompra,
            'prostock' => $request->prostock,
            'prostockminimo' => $request->prostockminimo,
            'idTipoproducto' => $request->idTipoproducto,
            'idUnidadmedida' => $request->idUnidadmedida,
        ]);

        return redirect()->route('productos.index')->with('success', 'Producto actualizado exitosamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Producto $producto)
    {
        //
        $producto->delete();

        return redirect()->route('productos.index')->with('success', 'Producto eliminado exitosamente.');
    }
}
