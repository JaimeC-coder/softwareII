<div class="card col-12">
    <div class="card-header">
        <div class="d-flex row">
            <div class="col-6">
                <h3>Fecha inicio</h3>
                <input type="date" name="" id="min" class="form-control">
            </div>
            <div class="col-6">
                <h3>Fecha Final</h3>
                <input type="date" name="" id="max" class="form-control">
            </div>



        </div>
    </div>
    <div class="card-body col-12">
        <div class="table-responsive">
            <table class="table table-striped table-inverse" id="example">

                <thead class="thead-inverse">
                    <tr>
                        <th>#</th>
                        <th>Fecha y Hora</th>
                        <th>Documento del Cliente</th>
                        <th>cliente</th>
                        <th>Estado</th>
                        <th>Observaciones</th>
                        <th>Tipo Comprobante</th>
                        <th>Tipo Pago</th>
                        <th>Empleado</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($venta as $item)
                        <tr>

                            <td>{{ $item->idVenta }}</td>
                            <td>{{ $item->venfecha }} {{ $item->venhora }}</td>
                            <td>
                                @if ($item->vendocumentocliente)
                                    {{ $item->vendocumentocliente }}
                                @else
                                    -----
                                @endif
                            </td>
                            <td>
                                @if ($item->vendocumentocliente)
                                    {{ $item->vendocumentocliente }}
                                @else
                                    -----
                                @endif
                            </td>
                            <td>{{ $item->venestado }}</td>
                            <td>
                                @if ($item->venobservacion)
                                    {{ $item->venobservacion }}
                                @else
                                    -----
                                @endif
                            </td>
                            <td>{{ $item->tipoComprobante->tcomcomprobante }}</td>
                            <td>{{ $item->tipoPago->tpagotipo }}</td>
                            <td>{{ $item->empleado->user->name }}</td>
                            <td>{{ $item->ventotalneto }}</td>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="9">
                            <p style="text-align: end;"> TOTAL : </p>
                        </td>
                        <td id="total "> 0</td>
                    </tr>
                </tfoot>
            </table>
        </div>

    </div>
