@extends('adminlte::page')

@section('title', 'Empleados')

@section('content_header')
    <h1>Lista de Empleados</h1>
@stop

@section('content')

    <a href="empleados/create" class="btn btn-primary mb-3">CREAR</a>

    <table id="empleados" class="table table-striped table-bordered shadow-lg mt-4" style="width:100%">
        <thead class="bg-primary text-white">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Empleado</th>
                <th scope="col">Correo</th>
                <th scope="col">Rol</th>
                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($empleados as $empleado)
                <tr>
                    <td>{{ $empleado->idEmpleado }}</td>
                    <td>{{ $empleado->empnombres }} {{ $empleado->empapellidop }} {{ $empleado->empapellidom }}</td>
                    <td>{{ $empleado->user->email }}</td>
                    <td>
                        @foreach ($empleado->user->roles as $rol)
                            <li>{{ $rol->name }}</li>
                        @endforeach
                    </td>
                    <td>
                        <form action="{{ route('empleados.destroy', $empleado) }}" method="POST">
                            <a href="{{ route('empleados.edit', $empleado) }}" class="btn btn-info">Editar</a>
                            <a href="{{ route('empleados.show', $empleado) }}" class="btn btn-info">Ver</a>
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger">Borrar</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>

@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script>
        console.log('Hi!');
    </script>
@stop
