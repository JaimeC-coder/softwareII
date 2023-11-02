@extends('adminlte::page')

@section('title', 'Departamentos')



@section('content_header')
    <h1>Editar Departamentos</h1>
@stop

@section('content')

<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">

            @includeif('partials.errors')

            <div class="card card-default">
                <div class="card-header">
                    <span class="card-title">{{ __('Editar') }} Departamento</span>
                </div>
                <div class="card-body">
                    <form method="POST" action="{{ route('departamentos.update',$departamento) }}"  role="form" enctype="multipart/form-data">
                      {{ method_field('PATCH') }}-
                        @csrf

                        @include('departamentos.form')

                    </form>
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




