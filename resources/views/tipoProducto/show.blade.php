



@extends('adminlte::page')

@section('title', 'Departamentos')

@section('content_header')
    <h1>Informacion del Departamentos</h1>
@stop

@section('content')


<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="float-left">
                        <span class="card-title">{{ __('Show') }} Departamentos</span>
                    </div>
                    <div class="float-right">
                        <a class="btn btn-primary" href="{{ route('tipoProductos.index') }}"> {{ __('Back') }}</a>
                    </div>
                </div>

                <div class="card-body">

                    <div class="form-group">
                        <strong>#:</strong>
                        {{ $tipoProducto->idTipoproducto }}
                    </div>
                    <div class="form-group">
                        <strong>nombre:</strong>
                        {{ $tipoProducto->tpronombre }}
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
