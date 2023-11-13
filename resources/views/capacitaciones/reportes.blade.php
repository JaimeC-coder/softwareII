<div class="card col-12">
    <div class="card-header">
        <div class="d-flex row">

        </div>
    </div>
    <div class="card-body">
        <table class="table" id="example">
            <thead class="thead-inverse">
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
