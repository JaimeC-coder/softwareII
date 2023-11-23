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
                    <a class="nav-link active" href="#" id="tabGraficaVentas">Grafica de Seguridad
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" id="tabReportesVentas">Reportes de Seguridad</a>
                </li>
            </ul>
        </div>
        <div class="card-body">
            <div class="d-none" id="graficaVentas">
                <canvas id="myChart"></canvas>
            </div>
            <div class="d-none row" id="reportesVentas">
                @include('capacitaciones.reportes')
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
            xhr.open("GET", "{{ route('seguridad.graficaseguridad') }}", true);

            xhr.onload = function() {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    generarGrafica(response);
                    console.log(response);
                }
            };

            xhr.send();
        }


        function generarGrafica(response) {
            var ctx = document.getElementById('myChart');
            var data = {
                labels: response.labels,
                datasets: response.datasets
            };
            new Chart(ctx, {
                type: 'bar',
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

            let currentDate = new Date();

            let initDate = $('#initDate');
            let endDate = $('#endDate');

            if (initDate.val() === '') initDate.val(currentDate.toISOString().substr(0, 10));
            if (endDate.val() === '') endDate.val(currentDate.toISOString().substr(0, 10));



            // Custom range filtering function
            DataTable.ext.search.push(function(settings, data, dataIndex) {
                var minDate = new Date(initDate.val());
                var maxDate = new Date(endDate.val());
                var dateValue = new Date(data[2]); // A // use data for the age column
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

            var table = $('#example').DataTable(
                //     {
                //     order: [0, 'desc'],
                //     responsive: true,
                //     dom: 'lBfrtip',
                //     buttons: [{
                //             extend: 'excelHtml5',
                //             footer: true,
                //             title: 'Archivo',
                //             filename: 'Export_File',
                //             text: '<button class="btn btn-success"><i class="bi bi-file-earmark-excel"></i></button>',
                //             titleAttr: 'Exportar a Excel',
                //         },
                //         {
                //             extend: 'pdfHtml5',
                //             footer: true,
                //             title: 'Archivo PDF',
                //             filename: 'Export_File_pdf',
                //             text: '<button class="btn btn-danger"><i class="bi bi-filetype-pdf"></i></button>',
                //             titleAttr: 'Exportar a PDF',
                //         },
                //         {
                //             extend: 'copyHtml5',
                //             download: 'open',
                //             footer: true,
                //             title: 'Archivo',
                //             filename: 'Reporte',
                //             text: '<button class="btn btn-primary"><i class="bi bi-clipboard"></i></button>',
                //             titleAttr: 'Copiar al portapapeles',
                //         }
                //     ],
                //     "language": {
                //         "url": "{{ asset('assets/template/extensions/datatables.net-bs5/js/Spanish.json') }}"
                //     },
                //     "lengthMenu": [5, 10, 25, 50, "Todos"]
                // }
            );
   // Changes to the inputs will trigger a redraw to update the table
            initDate.on('input', function() {
                table.draw();
            });
            endDate.on('input', function() {
                table.draw();
            });
        });
    </script>
@stop
