@extends('adminlte::page')

@section('title', 'Empleados')

@section('content_header')
    <h1>Create de Empleados</h1>
@stop

@section('content')

<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">



            <div class="card card-default">
                <div class="card-header">
                    <span class="card-title">{{ __('Create') }} Empleado</span>
                </div>
                <div class="card-body">
                    <form method="POST" action="{{ route('empleados.store') }}"  role="form" enctype="multipart/form-data">
                        @csrf

                        @include('empleados.form')

                    </form>
                </div>
            </div>
        </div>
    </div>

   
    <a href="{{route('empleados.index')}}" class="btn btn-primary mb-3">Volver</a>
</section>




@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
@stop
