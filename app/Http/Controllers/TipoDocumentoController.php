<?php

namespace App\Http\Controllers;

use App\Models\TipoDocumento;
use Illuminate\Http\Request;

class TipoDocumentoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $tipoDocumentos = TipoDocumento::all();

        return view('tipoDocumento.index', compact('tipoDocumentos'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
       // $tipoDocumento = new TipoDocumento();
        return redirect()->route('tipodocumentos.index')->with('success', 'Esta accion no es permitidad.');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        TipoDocumento::create([
            'tdocdescripcion' => $request->tdocdescripcion,
        ]);

        return redirect()->route('tipoDocumentos.index')->with('success', 'Tipo de documento creado exitosamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(TipoDocumento $tipoDocumento)
    {
        //
        return view('tipoDocumentos.show', compact('tipoDocumento'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(TipoDocumento $tipoDocumento)
    {
        //
        return view('tipoDocumentos.edit', compact('tipoDocumento'));

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, TipoDocumento $tipoDocumento)
    {
        //
        $tipoDocumento->update([
            'tdocdescripcion' => $request->tdocdescripcion,
        ]);

        return redirect()->route('tipoDocumentos.index')->with('success', 'Tipo de documento actualizado exitosamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TipoDocumento $tipoDocumento)
    {
        //
        $tipoDocumento->delete();

        return redirect()->route('tipoDocumentos.index')->with('success', 'Tipo de documento eliminado exitosamente.');
    }
}
