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
        $unidadMedida = new UnidadMedidas();

        return view('unidadMedida.create', compact('unidadMedida'));
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
    public function show(UnidadMedidas $unidadMedida)
    {
        //

        return view('unidadMedida.show', compact('unidadMedida'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(UnidadMedidas $unidadMedida)
    {
        //
        return view('unidadMedida.edit', compact('unidadMedida'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, UnidadMedidas $unidadMedida)
    {
        //
        $unidadMedida->update([
            'umednombre' => $request->umednombre,
        ]);

        return redirect()->route('unidadMedidas.index')->with('success', 'Unidad de medida actualizada exitosamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(UnidadMedidas $unidadMedida)
    {
        //
        $unidadMedida->delete();

        return redirect()->route('unidadMedidas.index')->with('success', 'Unidad de medida eliminada exitosamente.');
    }
}
