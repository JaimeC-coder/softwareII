<?php

use App\Http\Controllers\EmpleadoController;
use App\Http\Controllers\PermissionsionController;
use App\Http\Controllers\RolController;
use Illuminate\Support\Facades\Route;
use Spatie\Permission\Contracts\Permission;

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

Route::get('/', function () {
    return view('home');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('home');
    })->name('home');
    Route::resource('empleados' , EmpleadoController::class)->names('empleados')->middleware('auth');
    Route::resource('roles' , RolController::class)->names('roles')->middleware('auth');
    Route::resource('permisos' , PermissionsionController::class)->names('permisos')->middleware('auth');
});
