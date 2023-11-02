@extends('adminlte::page')

@section('title', 'Tipo de Productos')

@section('content_header')
    <h1>Lista de Unidades de Medida</h1>
@stop

@section('content')


    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Unidades de Medida') }}
                            </span>

                             <div class="float-right">
                                <a href="{{ route('unidadmedidas.create') }}" class="btn btn-primary mb-3">CREAR</a>
                              </div>
                        </div>
                    </div>
                    @if ($message = Session::get('success'))
                        <div class="alert alert-success">
                            <p>{{ $message }}</p>
                        </div>
                    @endif

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead class="thead">
                                    <tr>
                                        <th>#</th>
                                        <th>Unidad</th>
                                        <th>Accion</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @foreach ($unidadMedidas as $item)
                                        <tr>
                                            <td>{{ $item->idUnidadmedida}}</td>
                                            <td>{{ $item->umednombre}}</td>
                                            <td>
                                                <form action="{{route('unidadmedidas.destroy',$item)}}" method="POST">
                                                    <a href="{{route('unidadmedidas.edit',$item)}}" class="btn btn-info">Editar</a>
                                                    <a href="{{route('unidadmedidas.show',$item)}}" class="btn btn-info">Ver</a>
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger">Borrar</button>
                                                </form>
                                            </td>

                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>





@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
@stop
