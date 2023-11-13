<div class="card col-12">

    <div class="card-body">
        <div class="table-responsive">
            <table class="table   table-striped table-hover" id="table1">
                <thead class="thead">
                    <tr>
                        <th>#</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Precio de Compra</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Stock Min</th>
                        <th>Tipo de producto</th>
                        <th>Uninad de medida</th>

                    </tr>
                </thead>
                <tbody>
                    @foreach ($productos as $producto)
                        <tr>
                            <td>{{ $producto->idProducto }}</td>
                            <td>{{ $producto->pronombre }}</td>
                            <td>{{ $producto->prodescripcion }}</td>
                            <td>{{ $producto->propreciocompra }}</td>
                            <td>{{ $producto->propreciounitario }}</td>
                            <td>
                                @if ($producto->prostock < $producto->prostockminimo)
                                    <span
                                        class="badge badge-danger">{{ $producto->prostock }}</span>@else{{ $producto->prostock }}
                                @endif
                            </td>
                            <td>{{ $producto->prostockminimo }}</td>
                            <td>{{ $producto->tipoproducto->tpronombre }}</td>
                            <td>{{ $producto->unidadMedida->umednombre }}</td>


                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
