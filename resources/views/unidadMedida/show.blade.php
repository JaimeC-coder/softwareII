



@extends('adminlte::page')

@section('title', 'Unidad de Medida')

@section('content_header')
    <h1>Informacion de Unidad de Medida</h1>
@stop

@section('content')


<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="float-left">
                        <span class="card-title">{{ __('Show') }} Unidad de medida</span>
                    </div>
                    <div class="float-right">
                        <a class="btn btn-primary" href="{{ route('unidadmedidas.index') }}"> {{ __('Back') }}</a>
                    </div>
                </div>

                <div class="card-body">
                    <div class="form-group">
                        <strong>#:</strong>
                        {{ $unidadmedida->idUnidadmedida}}
                    </div>
                    <div class="form-group">
                        <strong>nombre:</strong>
                        {{ $unidadmedida->umednombre}}
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
