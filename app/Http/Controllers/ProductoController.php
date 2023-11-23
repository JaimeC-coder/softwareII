<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use App\Models\TipoProducto;
use App\Models\UnidadMedidas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
        $tipoProducto = TipoProducto::pluck('tpronombre', 'idTipoproducto');
        $unidadMedida = UnidadMedidas::pluck('umednombre', 'idUnidadmedida');

        return view('productos.create', compact('producto', 'tipoProducto', 'unidadMedida'));

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
        $tipoProducto = TipoProducto::pluck('tpronombre', 'idTipoproducto');
        $unidadMedida = UnidadMedidas::pluck('umednombre', 'idUnidadmedida');
        return view('productos.edit', compact('producto', 'tipoProducto', 'unidadMedida'));
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

    // public function productosxcategoria(){
    //     //cuentame la cantidad de productos que hay en estock y separamelos por categoria y su unidad de medida
    //     $productos = Producto::;

    // }

    //productos comparacion de productos con su estock minimo
    public function productosStockMinimo()
    {
        $productos = Producto::all();
        return view('productos.stockminimo', compact('productos'));
    }



    public function dasboard()
    {
        $productos = Producto::all();
        return view('dashboard.abastecimiento', compact('productos'));
    }

    public function graficaabastecimiento()
    {
        $productosPorCategoria = DB::table('productos')
        ->join('tipo_productos', 'productos.idTipoproducto', '=', 'tipo_productos.idTipoproducto')
        ->select('tipo_productos.tpronombre as categoria', DB::raw('COUNT(productos.idProducto) as cantidad_productos'))
        ->groupBy('tipo_productos.tpronombre')
        ->get();

        $labels = [];
        $data = [];

        foreach ($productosPorCategoria as $mes) {
            $labels[] = $mes->categoria;
            $data[] = $mes->cantidad_productos;
        }


        $response = [
            'labels' => $labels,
            'label' => 'Cantidad de productos ',
            'data' => $data,
            'fill' => false,
            'borderColor' => '#4bc0c0',
            'tension' => 0.1,

        ];

        return response()->json($response);
    }
    public function graficaabastecimientocantidadminnormal()
    {
        $productosPorCategoria = Producto::all();

        $labels = [];
        $data = [];

        foreach ($productosPorCategoria as $mes) {
            $labels[] = $mes->categoria;
            $data[] = $mes->cantidad_productos;
        }



        $respuesta = [
            'labels' => $productosPorCategoria->pluck('pronombre'),
            'dataset' => [
                [
                    'label' => 'Stock actual',
                    'data' => $productosPorCategoria->pluck('prostock'),
                    'fill' => false,
                    'borderColor' => '#4bc0c0',
                    'tension' => 0.1,
                ],
                [
                    'label' => 'Stock minimo',
                    'data' => $productosPorCategoria->pluck('prostockminimo'),
                    'fill' => false,
                    'borderColor' => '#565656',
                    'tension' => 0.1,
                ],
            ]
        ];


        return response()->json($respuesta);
    }
}
