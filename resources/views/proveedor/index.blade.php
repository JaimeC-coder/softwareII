@extends('adminlte::page')

@section('title', 'Proveedores')

@section('content_header')
    <h1>Lista de Proveedores</h1>
@stop

@section('content')


    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Proveedores') }}
                            </span>

                            <div class="float-right">
                                <a href="proveedores/create" class="btn btn-primary mb-3">CREAR</a>
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
                                        <th>Documento</th>
                                        <th>Telefono</th>
                                        <th>Correo</th>
                                        <th>Direccion</th>
                                        <th>Razon Social</th>
                                        <th>Accion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($proveedores as $item)
                                        <tr>
                                            <td>{{ $item->idProveedor }}</td>
                                            <td>{{ $item->provdoc }}</td>
                                            <td>{{ $item->provtelefono }}</td>
                                            <td>{{ $item->provcorreo }}</td>
                                            <td>{{ $item->provdireccion }}</td>
                                            <td>{{ $item->provrazonsocial }}</td>
                                            <td>
                                                <form action="{{ route('proveedores.destroy', $item) }}" method="POST">
                                                    <a href="{{ route('proveedores.edit', $item) }}"
                                                        class="btn btn-info">Editar</a>
                                                    <a href="{{ route('proveedores.show', $item) }}"
                                                        class="btn btn-info">Ver</a>
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
    <script>
        console.log('Hi!');
    </script>
@stop
