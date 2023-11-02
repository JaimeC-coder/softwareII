@extends('adminlte::page')

@section('title', 'Tipo de Productos')

@section('content_header')
    <h1>Lista de Tipo de Productos</h1>
@stop

@section('content')


    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Tipo de Productos') }}
                            </span>

                             <div class="float-right">
                                <a href="tipoProductos/create" class="btn btn-primary mb-3">CREAR</a>
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

                                    @foreach ($tipoProductos as $item)
                                        <tr>
                                            <td>{{ $item->idTipoproducto }}</td>
                                            <td>{{ $item->tpronombre }}</td>
                                            <td>
                                                <form action="{{route('tipoproductos.destroy',$item)}}" method="POST">
                                                    <a href="{{route('tipoproductos.edit',$item)}}" class="btn btn-info">Editar</a>
                                                    <a href="{{route('tipoproductos.show',$item)}}" class="btn btn-info">Ver</a>
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
