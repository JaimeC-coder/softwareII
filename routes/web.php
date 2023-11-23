<?php

use App\Http\Controllers\AsistenciaController;
use App\Http\Controllers\CapacitacionController;
use App\Http\Controllers\CompraController;
use App\Http\Controllers\DepartamentoController;
use App\Http\Controllers\EmpleadoController;
use App\Http\Controllers\PermissionsionController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\ProveedoresController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\TipoComprobanteController;
use App\Http\Controllers\TipoPagoController;
use App\Http\Controllers\TipoProductoController;
use App\Http\Controllers\UnidadMedidasController;
use App\Http\Controllers\VentaController;
use App\Http\Controllers\DocumentoController;
use App\Http\Controllers\TipoDocumentoController;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/



Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/', function () {
        return view('home');
    });

    Route::resource('empleados', EmpleadoController::class)->names('empleados')->middleware('auth');
    Route::resource('roles', RolController::class)->parameters(['roles' => 'role'])->names('roles')->middleware('auth');
    Route::resource('permisos', PermissionsionController::class)->names('permisos')->middleware('auth');
    Route::resource('departamentos', DepartamentoController::class)->names('departamentos')->middleware('auth');
    Route::resource('tipoproductos', TipoProductoController::class)->names('tipoproductos')->middleware('auth');
    Route::resource('proveedores', ProveedoresController::class)->parameters(['proveedores' => 'proveedores'])->names('proveedores')->middleware('auth');
    Route::resource('tipopagos', TipoPagoController::class)->names('tipopagos')->middleware('auth');
    Route::resource('tipocomprobantes', TipoComprobanteController::class)->names('tipocomprobantes')->middleware('auth');
    Route::resource('unidadmedidas', UnidadMedidasController::class)->names('unidadmedidas')->middleware('auth');
    //implemetar vistas
    Route::resource('productos', ProductoController::class)->names('productos')->middleware('auth');
    Route::resource('ventas', VentaController::class)->names('ventas')->middleware('auth');
    Route::resource('compras', CompraController::class)->names('compras')->middleware('auth');
    Route::resource('documentos', DocumentoController::class)->names('documentos')->middleware('auth');
    Route::resource('tipodocumentos', TipoDocumentoController::class)->names('tipodocumentos')->middleware('auth');
    Route::resource('capacitaciones', CapacitacionController::class)->parameters([
        'capacitaciones' => 'capacitacion'
    ])->names('capacitaciones')->middleware('auth');

    Route::get('capacitaciones/{capacitacion}/asist', [CapacitacionController::class, 'asistencia'])->name('capacitaciones.asist');
    Route::POST('capacitaciones/guardar', [CapacitacionController::class, 'guardar'])->name('capacitaciones.guardar');
    //Faltan
    Route::resource('asistencias', AsistenciaController::class)->names('asistencias')->middleware('auth');
    Route::get('default', function () {
        return view('default');
    })->name('default')->middleware('auth');
});

Route::get('ventas/pdf/{venta}',[VentaController::class,'pdf'])->name('ventas.pdf');

    Route::get('compras/pdf/{compra}',[CompraController::class,'pdf'])->name('compras.pdf');

Route::prefix('dasboard')->group(function () {
    Route::prefix('abastecimiento')->group(function () {
        Route::get('/', [ProductoController::class, 'dasboard'])->name('dasboard.abastecimiento');
        Route::get('graficaabastecimiento', [ProductoController::class, 'graficaabastecimiento'])->name('abastecimiento.graficaabastecimiento');
        Route::get('graficaabastecimiento1', [ProductoController::class, 'graficaabastecimientocantidadminnormal'])->name('abastecimiento.graficaabastecimiento1');
    });
    Route::prefix('ventas')->group(function () {
        Route::get('/', [VentaController::class, 'dasboard'])->name('dasboard.ventas');
        Route::get('graficaventas', [VentaController::class, 'ventas'])->name('ventas.graficaventas');
    });
    Route::prefix('compras')->group(function () {
        Route::get('/', [CompraController::class, 'dasboard'])->name('dasboard.compras');
        Route::get('graficacompras', [CompraController::class, 'compras'])->name('compras.graficacompras');
    });
    Route::prefix('finanzas')->group(function () {
        Route::get('/', [DocumentoController::class, 'dasboard'])->name('dasboard.finanzas');
        Route::get('graficafinanzas', [DocumentoController::class, 'finanzas'])->name('finanzas.graficafinanzas');
    });
    Route::prefix('seguridad')->group(function () {
        Route::get('/', [CapacitacionController::class, 'dasboard'])->name('dasboard.seguridad');
        Route::get('graficaseguridad', [CapacitacionController::class, 'seguridad'])->name('seguridad.graficaseguridad');
    });

});
