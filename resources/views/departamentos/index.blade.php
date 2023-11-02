@extends('adminlte::page')

@section('title', 'Departamentos')

@section('content_header')
    <h1>Lista de Departamentos</h1>
@stop

@section('content')


    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Departamentos') }}
                            </span>

                             <div class="float-right">
                                <a href="departamentos/create" class="btn btn-primary mb-3">CREAR</a>
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
                                        <th>Departamento</th>
                                        <th>Accion</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @foreach ($departamentos as $item)
                                        <tr>
                                            <td>{{ $item->idDepartamento }}</td>
                                            <td>{{ $item->depnombre }}</td>
                                            <td>
                                                <form action="{{route('departamentos.destroy',$item)}}" method="POST">
                                                    <a href="{{route('departamentos.edit',$item)}}" class="btn btn-info">Editar</a>
                                                    <a href="{{route('departamentos.show',$item)}}" class="btn btn-info">Ver</a>
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
