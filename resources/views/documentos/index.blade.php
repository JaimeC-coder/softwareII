@extends('adminlte::page')

@section('title', 'Compras')

@section('content_header')
    <h1>Listar Ingresos y egresos</h1>
@stop

@section('content')


    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Ingresos y Egresos') }}
                            </span>

                            <div class="float-right">
                                {{-- <a href="{{ route('ventas.create') }}" class="btn btn-primary mb-3">CREAR</a> --}}
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
                                    @php
                                        $montofinal = 0;
                                    @endphp
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

            </div>
        </div>
    </div>





@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script>
        console.log('Hi!');
    </script>
@stop
