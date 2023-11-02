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
use App\Models\TipoDocumento;
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
    Route::resource('roles', RolController::class)->names('roles')->middleware('auth');
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
