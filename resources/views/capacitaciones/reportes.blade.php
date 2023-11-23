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
        <div class="table-responsive">
            <table class="table table-striped table-hover"id="example">
                <thead class="thead">
                    <tr>
                        <th>No</th>
                        <th>Capacitador</th>
                        <th>Fecha Inicio</th>

                    </tr>
                </thead>
                <tbody>
                    @foreach ($capacitaciones as $item)
                        <tr>
                            <td>{{ $item->idCapacitacion }}</td>
                            <td>{{ $item->capcapacitador }}</td>
                            <td>{{ $item->capfechainicio }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
