



@extends('adminlte::page')

@section('title', 'Empleados')

@section('content_header')
    <h1>Informacion del Empleado</h1>
@stop

@section('content')


<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="float-left">
                        <span class="card-title">{{ __('Show') }} Empleado</span>
                    </div>
                    <div class="float-right">
                        <a class="btn btn-primary" href="{{ route('empleados.index') }}"> {{ __('Back') }}</a>
                    </div>
                </div>

                <div class="card-body">

                    <div class="form-group">
                        <strong>#:</strong>
                        {{ $empleado->idEmpleado }}
                    </div>
                    <div class="form-group">
                        <strong>nombre:</strong>
                        {{ $empleado->empnombres }}
                    </div>
                    <div class="form-group">
                        <strong>Apellidos:</strong>
                        {{ $empleado->empapellidop }} {{ $empleado->empapellidom }}
                    </div>

                    <div class="form-group">
                        <strong>DNI:</strong>
                        {{ $empleado->empdni }}
                    </div>
                    <div class="form-group">
                        <strong>Direccion:</strong>
                        {{ $empleado->empdireccion }}
                    </div>
                    <div class="form-group">
                        <strong>Telefono:</strong>
                        {{ $empleado->emptelefono }}
                    </div>
                    <div class="form-group">
                        <strong>Telefono:</strong>
                        {{ $empleado->emptelefono }}
                    </div>
                    <div class="form-group">
                        <strong>Departamento:</strong>
                        {{ $empleado->departamento->depnombre }}
                    </div>
                    <div class="form-group">
                        <strong>Usuario:</strong>
                        {{ $empleado->user->name }}
                    </div>
                    <div class="form-group">
                        <strong>correo:</strong>
                        {{ $empleado->user->email }}
                    </div>
                    <div class="form-group">
                        <strong>Roles:</strong>
                        {{ $empleado->user->roles->pluck('name')->implode(' - ') }}
                    </div>


                </div>
            </div>
        </div>
    </div>
</section>



@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
@stop
