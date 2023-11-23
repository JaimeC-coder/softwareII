<div class="card col-12">
    <div class="card-header">
        <div class="d-flex row">
        </div>
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
    <div class="table-responsive">
        <div class="card-body col-12">
            @php $montofinal = 0;@endphp
            <table class=" row table table-striped table-inverse table-responsive" id="example">


                <thead class="thead-inverse">
                    <tr>
                        <th>#</th>
                        <th>Tipo de documento</th>
                        <th>docnumero</th>
                        <th>Monto</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($documentos as $item)
                        @if ($item->docsimbolo == '+')
                            <tr class="bg-success">
                                @php
                                    if ($item->docsimbolo == '+') {
                                        $montofinal = $montofinal + $item->docmonto;
                                    } elseif ($item->docsimbolo == '-') {
                                        $montofinal = $montofinal - $item->docmonto;
                                    } else {
                                        $montofinal = $montofinal;
                                    }

                                @endphp
                                <td class="bg-success">{{ $item->idDocumento }}</td>
                                <td class="bg-success">{{ $item->tipoDocumento->tidDocumento }}</td>
                                <td class="bg-success">{{ $item->docnumero }}</td>
                                <td class="bg-success">{{ $item->docmonto }}</td>


                            </tr>
                        @else
                            <tr class="bg-danger">
                                @php
                                    if ($item->docsimbolo == '+') {
                                        $montofinal = $montofinal + $item->docmonto;
                                    } elseif ($item->docsimbolo == '-') {
                                        $montofinal = $montofinal - $item->docmonto;
                                    } else {
                                        $montofinal = $montofinal;
                                    }

                                @endphp
                                <td class="bg-danger">{{ $item->idDocumento }}</td>
                                <td class="bg-danger">{{ $item->tipoDocumento->tidDocumento }}</td>
                                <td class="bg-danger">{{ $item->docnumero }}</td>
                                <td class="bg-danger">{{ $item->docmonto }}</td>
                            </tr>
                        @endif
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3">Total</th>
                        <th colspan="2">{{ $montofinal }}</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

</div>
