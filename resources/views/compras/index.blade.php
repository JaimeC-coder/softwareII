@extends('adminlte::page')

@section('title', 'Compras')

@section('content_header')
    <h1>Listar Compras</h1>
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
                                <a href="{{ route('compras.create') }}" class="btn btn-primary mb-3">CREAR</a>
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
                            <table class="table table-striped table-hover" id="tabla1">
                                <thead class="thead">
                                    <tr>
                                        <th>#</th>
                                        <th>Fecha y Hora</th>
                                        <th>Descripcion</th>
                                        <th>Total </th>
                                        <th>Tipo Comprobante</th>
                                        <th>Tipo Pago</th>
                                        <th>Proveedor</th>
                                        <th>Empleado</th>
                                        {{-- <th>Documento</th> --}}
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($compras as $item)
                                        <tr>

                                            <td>{{ $item->idOrdencompra }}</td>
                                            <td>{{ $item->orcomfecha }} {{ $item->orcomhora }}</td>
                                            <td>{{ $item->orcomdescripcion }}</td>
                                            <td>{{ $item->orcomtotal }}</td>
                                            <td>{{ $item->tipoComprobante->tcomcomprobante }}</td>
                                            <td>{{ $item->tipoPago->tpagotipo }}</td>
                                            <td>{{ $item->proveedor->provrazonsocial }}</td>
                                            <td>{{ $item->empleado->user->name }}</td>
                                            {{-- <td>
                                                <a href="{{ Storage::url($item->docontable->dconurl) }}"
                                                    download="item{{ $item->iditem }}.pdf"><i
                                                        class="fas fa-cloud-download-alt"></i></a>

                                            </td> --}}
                                            <td>
                                                <form action="{{ route('compras.destroy', $item) }}" method="POST">
                                                    {{-- @can('ventas.show') --}}
                                                    <a class="btn btn-sm btn-primary " href="{{ route('compras.show', $item) }}"><i class="fa fa-fw fa-eye"></i></a>

                                                    <a class="btn btn-sm btn-danger" href="{{ route('compras.pdf', $item) }}"><i class="fa fa-fw fa-edit"></i> </a>
                                                    {{-- @endcan --}}
                                                    {{-- @endcan
                                                    @can('ventas.edit') --}}
                                                    {{-- <a class="btn btn-sm btn-success" href="{{ route('ventas.edit', $venta) }}"><i class="fa fa-fw fa-edit"></i> {{ __('Edit') }}</a> --}}
                                                    {{-- @endcan
                                                    @can('ventas.delete') --}}
                                                    {{-- @csrf
                                                    @method('DELETE') --}}
                                                    {{-- <button type="submit" class="btn btn-danger btn-sm"><i
                                                            class="fa fa-fw fa-trash"></i> {{ __('Delete') }}</button> --}}
                                                    {{-- @endcan --}}
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
