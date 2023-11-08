@extends('adminlte::page')

@section('title', 'Dashboard')

@section('content_header')
    <h1>Dashboard</h1>
@stop

@section('content')
    <div class="card text-center">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#" id="tabGraficaVentas">Grafica de Ventas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" id="tabReportesVentas">Reportes de Ventas</a>
                </li>
            </ul>
        </div>
        <div class="card-body">
            <div class="d-none" id="graficaVentas">
                <canvas id="myChart"></canvas>
            </div>
            <div class="d-none row" id="reportesVentas">
                @include('ventas.reportes')
            </div>


        </div>
    </div>
@stop

@section('js')


    <script>
        document.addEventListener("DOMContentLoaded", function() {
            traerdatos();
        });

        function traerdatos() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "{{ route('ventas.graficaventas') }}", true);

            xhr.onload = function() {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    generarGrafica(response);
                }
            };

            xhr.send();
        }

        function generarGrafica(response) {
            var ctx = document.getElementById('myChart');
            var data = {
                labels: response.labels,
                datasets: [{
                    label: response.label,
                    data: response.data,
                    fill: response.fill,
                    borderColor: response.borderColor,
                    tension: response.tension,
                }]
            };
            new Chart(ctx, {
                type: 'line',
                data: data
            });
        }
    </script>


    <script>
        function cambiarContenido(tabId) {

            document.getElementById('tabGraficaVentas').classList.remove('active');
            document.getElementById('tabReportesVentas').classList.remove('active');


            document.getElementById(tabId).classList.add('active');


            var cardBody = document.querySelector('.card-body');
            if (tabId === 'tabGraficaVentas') {

                document.getElementById('graficaVentas').classList.remove('d-none');
                document.getElementById('reportesVentas').classList.add('d-none');

            } else if (tabId === 'tabReportesVentas') {
                document.getElementById('graficaVentas').classList.add('d-none');
                document.getElementById('reportesVentas').classList.remove('d-none');
            }
        }


        document.getElementById('tabGraficaVentas').addEventListener('click', function() {
            cambiarContenido('tabGraficaVentas');
        });

        document.getElementById('tabReportesVentas').addEventListener('click', function() {
            cambiarContenido('tabReportesVentas');
        });

        // Llamar a la función inicialmente para mostrar la pestaña activa
        cambiarContenido('tabGraficaVentas');
    </script>

    <script>
        $(document).ready(function() {
            var DataTable = $('#example').DataTable({
                footerCallback: function(row, data, start, end, display) {
                    let api = this.api();

                    // Remove the formatting to get integer data for summation
                    let intVal = function(i) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i :
                            0;
                    };

                    // Total over all pages
                    total = api
                        .column(9)
                        .data()
                        .reduce((a, b) => intVal(a) + intVal(b), 0);

                    // Total over this page
                    pageTotal = api
                        .column(9, {
                            page: 'current'
                        })
                        .data()
                        .reduce((a, b) => intVal(a) + intVal(b), 0);

                    // Update footer
                    api.column(9).footer().innerHTML =
                        'S/' + total;
                },
                dom: 'Bfrtip',

                buttons: [{
                        extend: 'excel',
                        text: 'Excel',
                        exportOptions: {
                            columns: ':not(:last-child)' // Excluir la última columna
                        }
                    },
                    {
                        extend: 'pdf',
                        text: 'PDF',
                        exportOptions: {
                            columns: ':not(:last-child)' // Excluir la última columna
                        }
                    }
                ],

                //pasar los botones a la derecha

                "lengthMenu": [
                    [5, 10, 50, -1],
                    [5, 10, 50, "All"]
                ],
                "paging": false,
                "bLengthChange": false,
                "searching": false,
                "language": {
                    "zeroRecords": "No se encontraron resultados en su busqueda"
                }

            });

            var minEl = $('#min');
            var maxEl = $('#max');

            // Custom range filtering function
            DataTable.ext.search.push(function(settings, data, dataIndex) {
                var minDate = new Date(minEl.value);
                var maxDate = new Date(maxEl.value);
                var dateValue = new Date(data[3]); // A // use data for the age column

                if (
                    isNaN(minDate) && isNaN(maxDate) ||
                    isNaN(minDate) && dateValue <= maxDate ||
                    minDate <= dateValue && isNaN(maxDate) ||
                    minDate <= dateValue && dateValue <= maxDate
                ) {
                    return true;
                }

                return false;
            });

            var table = $('#example').DataTable();

            // Changes to the inputs will trigger a redraw to update the table
            minEl.on('input', function() {
                table.draw();
            });
            maxEl.on('input', function() {
                table.draw();
            });
        });
    </script>
@stop
