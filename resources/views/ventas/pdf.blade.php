<!DOCTYPE html>
<html>

<head>
    <meta charset="gb18030">
    <style>
        #ticket {
            font-family: "Arial Narrow";
            font-size: 17px;
            font-style: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        thead tr th {
            border-top: 1.5px dashed black;
            border-bottom: 1.5px dashed black;
        }

        .producto {
            width: 60px;
            max-width: 75px;
        }

        .cantidad {
            width: 100px;
            word-break: break-all;
            background: yellow;
        }

        .precio {
            word-break: break-all;
        }

        .centrado {
            text-align: center;
            align-content: center;
        }

        .ticket {
            width: 9cm;
            max-width: 9cm;
        }

        img {
            width: 100px;
        }

        p {
            font-size: 13px;
        }

        .lineas {
            font-size: 17px;
        }

        .etiq {
            width: 100px;
            display: block;
            float: left;
        }

        .etiq2 {
            width: 40%;
            display: block;
            float: left;
        }

        .etiq3 {
            width: 90%;
            display: block;
            float: left;
        }

        .etiq4 {
            width: 100%;
            display: block;
            float: left;
        }

        .puntos {
            width: 10%;
            display: block;
            float: left;
        }

        .moneda {
            width: 50%;
            display: block;
            float: right;
            text-align: right;
        }

        .montos {
            width: 100%;
        }

        .oculto {
            display: none;
        }

        @media print {

            .oculto-impresion,
            .oculto-impresion * {
                display: none !important;
            }
        }
    </style>

<body>

    <div class="ticket" id="ticket">
        <div class="center">
            <h3 style="margin: 0; font-size: 16px; text-align: center">
                GRIFO PREMEX
            </h3>

            <!-- <h3 style="margin: 0; font-size: 24px; text-align: center"><b>LED SIGHT</b></h3> -->
            <br>
            <h6 style="margin: 0; font-size: 14px; text-align: center">Mariano Melgar #212 - CHEPEN</h6>
            <h6 style="margin: 0; font-size: 14px; text-align: center">CEL. 9999999999 - RUC : 78952143697778</h6>
            <br>

        </div>

        <div class="lineas">------------------------------------------------------------</div>
        <span class="etiq">Vendedor</span>:<span>{{ $venta->Empleado->empnombres }}
            {{ $venta->Empleado->empapellidop }}</span>
        <br>
        <br>
        <span class="etiq">Fecha</span>:<span>{{ $venta->venfecha }}- {{ $venta->venhora }}</span>
        <br>
        <br>
        <span class="etiq">Tipo de Comprobante</span>:<span> {{ $venta->tipoComprobante->tcomcomprobante }}</span>
        <br>
        <br><br>
        <span class="etiq">Tipo de Pago</span>:<span>{{ $venta->tipoPago->tpagotipo }}</span>
        <br>
        <br>
        <br>


        <table>
            <thead>
                <tr>
                    <th>DESCRIPCION.</th>
                    <th>CANT</th>
                    <th>P. UNIT</th>
                    <th>TOTAL</th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($detalleventa as $item) { ?>
                <tr>
                    <td>{{ $item->Producto->pronombre }}</td>
                    <td style="text-align:center">{{ $item->dvcantidad }}
                        {{ $item->Producto->Unidadmedida->umednombre }}</td>
                    <td style="text-align:center"> {{ $item->dvpreciounitario }}</td>
                    <td style="text-align:center">{{ $item->dvpreciounitario * $item->dvcantidad }}</td>
                </tr>
                <?php    } ?>
            </tbody>
        </table>
        <div class="lineas">------------------------------------------------------------</div>

        <br><span class="etiq2">Total</span>
        <span class="puntos">: </span>
        <span class="moneda"> S/{{ $venta->venmonto }}</span>
        <br>
        <br>
        <span class="etiq2">Impuesto</span>
        <span class="puntos">: </span>
        <span class="moneda"> S/{{ $venta->venimpuesto }}</span>
        <br>
        <br><span class="etiq2">Total Neto</span>
        <span class="puntos">: </span>
        <span class="moneda">S/ {{ $venta->ventotalneto }}</span>
        <br>

        <center>
            {!!QrCode::size(120)->generate("Hola") !!}
            <p>Escanéame para volver a la página principal.</p>
            <br>
        </center>


    </div>


</body>

</html>
