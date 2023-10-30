@extends('adminlte::page')

@section('title', 'Proveedor')

@section('content_header')
    <h1>Informacion del Proveedor</h1>
@stop

@section('content')


<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="float-left">
                        <span class="card-title">{{ __('Show') }} Proveedor</span>
                    </div>
                    <div class="float-right">
                        <a class="btn btn-primary" href="{{ route('proveedores.index') }}"> {{ __('Back') }}</a>
                    </div>
                </div>

                <div class="card-body">


                    <div class="form-group">
                        <strong>#:</strong>
                        {{ $proveedores->idProveedor }}
                    </div>
                    <div class="form-group">
                        <strong>RUC:</strong>
                        {{ $proveedores->provdoc }}
                    </div>
                    <div class="form-group">
                        <strong>Telefono:</strong>
                        {{ $proveedores->provtelefono }}
                    </div>
                    <div class="form-group">
                        <strong>Correo:</strong>
                        {{ $proveedores->provcorreo }}
                    </div>
                    <div class="form-group">
                        <strong>Direccion:</strong>
                        {{ $proveedores->provdireccion }}
                    </div>
                    <div class="form-group">
                        <strong>Razon Social:</strong>
                        {{ $proveedores->provrazonsocial }}
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
