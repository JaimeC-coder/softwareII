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
        return view('unidadMedida.index', compact('unidadMedidas'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $unidadmedida = new UnidadMedidas();

        return view('unidadMedida.create', compact('unidadmedida'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        UnidadMedidas::create([
            'umednombre' => $request->umednombre,
        ]);

        return redirect()->route('unidadMedidas.index')->with('success', 'Unidad de medida creada exitosamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(UnidadMedidas $unidadmedida)
    {
        //

        return view('unidadMedida.show', compact('unidadmedida'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(UnidadMedidas $unidadmedida)
    {
        //
        return view('unidadMedida.edit', compact('unidadmedida'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, UnidadMedidas $unidadmedida)
    {
        //
        $unidadmedida->update([
            'umednombre' => $request->umednombre,
        ]);

        return redirect()->route('unidadMedidas.index')->with('success', 'Unidad de medida actualizada exitosamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(UnidadMedidas $unidadmedida)
    {
        //
        $unidadmedida->delete();

        return redirect()->route('unidadMedidas.index')->with('success', 'Unidad de medida eliminada exitosamente.');
    }
}
