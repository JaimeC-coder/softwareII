<div class="card col-12">
    <div class="card-header">
        <div class="d-flex row">

        </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-striped table-hover"id="tabla1">
                <thead class="thead">
                    <tr>
                        <th>No</th>
                        <th>Capacitador</th>
                        <th>Fecha Inicio</th>
                        <th>Fecha Final</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($capacitaciones as $item)
                        <tr>
                            <td>{{ $item->idCapacitacion }}</td>
                            <td>{{ $item->capcapacitador }}</td>
                            <td>{{ $item->capfechainicio }}</td>
                            <td>{{ $item->capfechafin }}</td>

                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
