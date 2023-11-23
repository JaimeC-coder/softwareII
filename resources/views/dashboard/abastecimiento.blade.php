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
                    <a class="nav-link active" href="#" id="tabGraficaVentas">Grafica de Productos</a>
                </li>

            </ul>
        </div>
        <div class="card-body">
            <div class="row" id="graficaVentas">
                <div class="col-12">
                    <canvas id="myChart"></canvas>
                </div>
                <div class="col-12">
                    <canvas id="myChart12"></canvas>
                </div>

            </div>



        </div>
    </div>
@stop

@section('js')


    <script>
        document.addEventListener("DOMContentLoaded", function() {
            traerdatos();
            traerdatos1();
        });

        function traerdatos() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "{{ route('abastecimiento.graficaabastecimiento') }}", true);

            xhr.onload = function() {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    generarGrafica(response);

                }
            };

            xhr.send();
        }
        function traerdatos1() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "{{ route('abastecimiento.graficaabastecimiento1') }}", true);

            xhr.onload = function() {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    console.log(response);
                    generarGrafica1(response);
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
                type: 'bar',
                data: data
            });
        }
        function generarGrafica1(response) {
            var ctx = document.getElementById('myChart12');
            var data = {
                labels: response.labels,
                datasets:response.datasets
            };
            new Chart(ctx, {
                type: 'bar',
                data: data
            });
        }
    </script>




    <script>

    </script>
@stop
