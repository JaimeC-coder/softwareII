@extends('adminlte::page')

@section('title', 'Tipo de Documentos')

@section('content_header')
    <h1>Lista de Tipo de Documentos </h1>
@stop

@section('content')


    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Tipo de Documentos') }}
                            </span>

                             <div class="float-right">
                                <a href="{{ route('tipodocumentos.create') }}" class="btn btn-primary mb-3">CREAR</a>
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
                                        <th>Descripcion</th>
                                        <th>Accion</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @foreach ($tipoDocumentos as $item)
                                        <tr>
                                            <td>{{ $item->idTipoDocumento}}</td>
                                            <td>{{ $item->tidDocumento}}</td>
                                            <td>
                                                <form action="{{route('tipodocumentos.destroy',$item)}}" method="POST">
                                                    <a href="{{route('tipodocumentos.edit',$item)}}" class="btn btn-info">Editar</a>
                                                    <a href="{{route('tipodocumentos.show',$item)}}" class="btn btn-info">Ver</a>
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
