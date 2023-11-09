<div class="card col-12">
    <div class="card-header">
        <div class="d-flex row">
            <div class="col-3">
                <h3>Fecha inicio</h3>
                <input type="date" name="" id="initDate" class="form-control">
            </div>
            <div class="col-3">
                <h3>Fecha Final</h3>
                <input type="date" name="" id="endDate" class="form-control">
            </div>
        </div>
    </div>
    <div class="card-body">
        <table class="table" id="example">
            <thead class="thead-inverse">
                <tr>
                    <th>#</th>
                    <th>Fecha y Hora</th>
                    <th>Descripcion</th>
                    <th>Tipo Comprobante</th>
                    <th>Tipo Pago</th>
                    <th>Proveedor</th>
                    <th>Empleado</th>
                    <th>Total </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($compra as $item)
                    <tr>

                        <td>{{ $item->idOrdencompra }}</td>
                        <td>{{ $item->orcomfecha }} {{ $item->orcomhora }}</td>
                        <td>{{ $item->orcomdescripcion }}</td>
                        <td>{{ $item->tipoComprobante->tcomcomprobante }}</td>
                        <td>{{ $item->tipoPago->tpagotipo }}</td>
                        <td>{{ $item->proveedor->provrazonsocial }}</td>
                        <td>{{ $item->empleado->user->name }}</td>
                        <td>{{ $item->orcomtotal }}</td>
                    </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="7">
                        <p style="text-align: end;"> TOTAL : </p>
                    </td>
                    <td id="total "> 0</td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
