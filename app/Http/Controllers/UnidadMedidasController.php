<?php

namespace App\Http\Controllers;

use App\Models\UnidadMedidas;
use Illuminate\Http\Request;

class UnidadMedidasController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $unidadMedidas = UnidadMedidas::all();
        return view('unidadMedidas.index', compact('unidadMedidas'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $unidadMedida = new UnidadMedidas();

        return view('unidadMedidas.create', compact('unidadMedida'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        UnidadMedidas::create([
            'umdescripcion' => $request->umdescripcion,
        ]);

        return redirect()->route('unidadMedidas.index')->with('success', 'Unidad de medida creada exitosamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(UnidadMedidas $unidadMedidas)
    {
        //
        return view('unidadMedidas.show', compact('unidadMedidas'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(UnidadMedidas $unidadMedidas)
    {
        //
        return view('unidadMedidas.edit', compact('unidadMedidas'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, UnidadMedidas $unidadMedidas)
    {
        //
        $unidadMedidas->update([
            'umdescripcion' => $request->umdescripcion,
        ]);

        return redirect()->route('unidadMedidas.index')->with('success', 'Unidad de medida actualizada exitosamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(UnidadMedidas $unidadMedidas)
    {
        //
        $unidadMedidas->delete();

        return redirect()->route('unidadMedidas.index')->with('success', 'Unidad de medida eliminada exitosamente.');
    }
}
