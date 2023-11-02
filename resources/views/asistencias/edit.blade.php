@extends('adminlte::page')

@section('title', 'Asistencia')



@section('content_header')
    <h1>Editar Asistencia</h1>
@stop


@section('content')
    <section class="content container-fluid">
        <div class="">
            <div class="col-md-12">

                @includeif('partials.errors')

                <div class="card card-default">
                    <div class="card-header">
                        <span class="card-title">{{ __('Update') }} Asistencia</span>
                    </div>
                    <div class="card-body">

                        <form method="POST" action="{{ route('capacitaciones.guardar') }}"  role="form" enctype="multipart/form-data">

                            @csrf

                            @include('asistencias.form')

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
