<?php

namespace App\Http\Controllers;

use App\Models\TipoPago;
use Illuminate\Http\Request;

class TipoPagoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    //tipoPagos
    public function index()
    {
        //
        $tipoPagos=TipoPago::all();
        return view('tipoPagos.index',compact('tipoPagos'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        $tipoPagos = new TipoPago();
        return view('tipoPagos.create',compact('tipoPagos'));

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        TipoPago::create([
            'tpagotipo' => $request->tpagotipo,

        ]);
        return redirect()->route('tipoPagos.index')->with('success','Tipo de pago creado exitosamente');

    }

    /**
     * Display the specified resource.
     */
    public function show(TipoPago $tipoPago)
    {
        //
        return view('tipoPagos.show',compact('tipoPago'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(TipoPago $tipoPago)
    {
        //
        return view('tipoPagos.edit',compact('tipoPago'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, TipoPago $tipoPago)
    {
        //
        $tipoPago->update([
            'tpagotipo' => $request->tpagotipo,
        ]);
        return redirect()->route('tipoPagos.index')->with('success','Tipo de pago actualizado exitosamente');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TipoPago $tipoPago)
    {
        //
        $tipoPago->delete();
        return redirect()->route('tipoPagos.index')->with('success','Tipo de pago eliminado exitosamente');
    }
}
