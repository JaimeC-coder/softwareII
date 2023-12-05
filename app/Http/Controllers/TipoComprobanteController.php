<?php

namespace App\Http\Controllers;

use App\Models\TipoComprobante;
use Illuminate\Http\Request;

class TipoComprobanteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $tipoComprobantes = TipoComprobante::all();
        return view('tipoComprobantes.index', compact('tipoComprobantes'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $tipoComprobante = new TipoComprobante();

        return view('tipoComprobantes.create', compact('tipoComprobante'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        TipoComprobante::create([
            'tcomcomprobante' => $request->tcomcomprobante
        ]);

        return redirect()->route('tipocomprobantes.index')->with('success', 'Tipo de comprobante creado exitosamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(TipoComprobante $tipoComprobante)
    {
        //
        return view('tipoComprobantes.show', compact('tipoComprobante'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(TipoComprobante $tipoComprobante)
    {
        //
        return view('tipoComprobantes.edit', compact('tipoComprobante'));

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, TipoComprobante $tipoComprobante)
    {
        //
        $tipoComprobante->update([
            'tcomcomprobante' => $request->tcomcomprobante,
        ]);

        return redirect()->route('tipocomprobantes.index')->with('success', 'Tipo de comprobante actualizado exitosamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TipoComprobante $tipoComprobante)
    {
        //
        $tipoComprobante->delete();
        return redirect()->route('tipocomprobantes.index')->with('success', 'Tipo de comprobante eliminado exitosamente.');
    }
}
