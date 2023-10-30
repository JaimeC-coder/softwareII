<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\EstadosFinanciero;
use App\Models\TipoComprobante;
use App\Models\TipoComprobanteVenta;
use App\Models\TipoPago;
class FinanzaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        TipoPago::create([
            'tpagotipo' => 'Efectivo',
        ]);
        TipoPago::create([
            'tpagotipo' => 'Tarjeta',
        ]);
        TipoPago::create([
            'tpagotipo' => 'Cheque',
        ]);
        TipoPago::create([
            'tpagotipo' => 'Transferencia',
        ]);
        TipoPago::create([
            'tpagotipo' => 'Deposito',
        ]);
        TipoPago::create([
            'tpagotipo' => 'Otro',
        ]);
        TipoComprobante::create([
            'tcomcomprobante' => 'Factura',
        ]);
        TipoComprobante::create([
            'tcomcomprobante' => 'Boleta',
        ]);
        TipoComprobante::create([
            'tcomcomprobante' => 'Nota de Crédito',
        ]);
        TipoComprobante::create([
            'tcomcomprobante' => 'Nota de Débito',
        ]);
        TipoComprobante::create([
            'tcomcomprobante' => 'Factura Electrónica',
        ]);
        TipoComprobante::create([
            'tcomcomprobante' => 'Boleta Electrónica',
        ]);
   
    }
}
