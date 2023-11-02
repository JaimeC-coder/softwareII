

@extends('adminlte::page')

@section('title', 'Capacitacion')

@section('content_header')
    <h1>Lista de Capacitacion</h1>
@stop

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <span id="card_title">
                                {{ __('Capacitacion') }}
                            </span>
                            <div class="float-right">
                                {{-- @can('capacitaciones.create') --}}
                                    <a href="{{ route('capacitaciones.create') }}" class="btn btn-primary btn-sm float-right"
                                        data-placement="left">
                                        {{ __('Create New') }}
                                    </a>
                                {{-- @endcan --}}
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
                            <table class="table table-striped table-hover"id="tabla1">
                                <thead class="thead">
                                    <tr>
                                        <th>No</th>
                                        <th>Capacitador</th>
                                        <th>Fecha Inicio</th>
                                        <th>Fecha Final</th>
                                        <th>
                                            Estado De la solicitud
                                        </th>
                                        <th>Action</th>
                                        <th>Asistencias</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($capacitaciones as $item)
                                        <tr>
                                            <td>{{ $item->idCapacitacion }}</td>
                                            <td>{{ $item->capcapacitador }}</td>
                                            <td>{{ $item->capfechainicio }}</td>
                                            <td>{{ $item->capfechafin }}</td>
                                            <td>


                                                @if ( $item->solicitud != null)
                                                    {{ $item->solicitud->solestado }}
                                                @else
                                                    ---
                                                @endif


                                            </td>
                                            <td>
                                                <form action="{{ route('capacitaciones.destroy', $item) }}"
                                                    method="POST">
                                                    {{-- @can('capacitaciones.show') --}}
                                                        <a class="btn btn-sm btn-primary "
                                                            href="{{ route('capacitaciones.show', $item) }}"><i
                                                                class="fa fa-fw fa-eye"></i> {{ __('Show') }}</a>
                                                    {{-- @endcan
                                                    @can('capacitaciones.edit') --}}
                                                        {{-- <a class="btn btn-sm btn-success"
                                                            href="{{ route('capacitaciones.edit', $item) }}"><i
                                                                class="fa fa-fw fa-edit"></i> {{ __('Edit') }}</a> --}}
                                                    {{-- @endcan
                                                    @can('capacitaciones.destroy') --}}
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger btn-sm"><i
                                                                class="fa fa-fw fa-trash"></i> {{ __('Delete') }}</button>
                                                    {{-- @endcan --}}
                                                </form>
                                            </td>
                                            <td>

                                                <a class="btn btn-sm btn-primary"
                                                    href="{{ route('capacitaciones.asist', $item) }}"><i
                                                        class="fa fa-fw fa-edit"></i> {{ __('Asistencia ') }}</a>

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
@endsection
@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
@stop
