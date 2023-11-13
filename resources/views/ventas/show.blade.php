@extends('adminlte::page')

@section('title', 'Detalle de Venta')

@section('content_header')
    <h1>Informacion de Venta</h1>
@stop

@section('content')


<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="float-left">
                        <span class="card-title">{{ __('Show') }} Venta</span>
                    </div>
                    <div class="float-right">
                        <a class="btn btn-primary" href="{{ route('ventas.index') }}"> {{ __('Back') }}</a>
                    </div>
                </div>
                <div class="card-body">

                    <div class="form-group">
                        <strong>Numero de la venta:</strong>
                        {{ $venta->idVenta }}
                    </div>
                    <div class="form-group">
                        <strong>Fecha y hora :</strong>
                        {{ $venta->venfecha }} {{ $venta->venhora }}
                    </div>
                    <div class="form-group">
                        <strong>Documento del cliente:</strong>
                        {{ $venta->vendocumentocliente }}
                    </div>

                    <div class="form-group">
                        <strong>Estado:</strong>
                        {{ $venta->venestado }}
                    </div>
                    <div class="form-group">
                        <strong>Monto:</strong>
                        S/. {{ $venta->venmonto }}
                    </div>
                    <div class="form-group">
                        <strong>Inpuesto:</strong>
                       S/. {{ $venta->venimpuesto }}
                    </div>
                    <div class="form-group">
                        <strong>Total neto:</strong>
                       S/. {{ $venta->ventotalneto }}
                    </div>
                    <div class="form-group">
                        <strong>Observacion:</strong>
                      {{ $venta->venobservacion }}
                    </div>
                    <div class="form-group">
                        <strong>Tipo de comprobante:</strong>
                        {{ $venta->tipoComprobante->tcomcomprobante }}
                    </div>
                    <div class="form-group">
                        <strong>Tipo de pago:</strong>
                        {{ $venta->tipoPago->tpagotipo }}
                    </div>
                    <div class="form-group">
                        <strong>Empleado:</strong>
                        {{ $venta->empleado->user->name }}
                    </div>

                    <div class="form-group">
                        <strong>Producto Comprado:</strong>
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th>Precio</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($detalleventa as $detalleVenta)
                                    <tr>
                                        <td>{{ $detalleVenta->producto->pronombre }}</td>
                                        <td>{{ $detalleVenta->dvcantidad }} {{$detalleVenta->producto->unidadMedida->umednombre}} </td>
                                        <td>S/.{{ $detalleVenta->dvpreciounitario }}</td>
                                        <td>S/.{{ $detalleVenta->dvcantidad * $detalleVenta->dvpreciounitario}}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                    </div>

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
