<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('compras', function (Blueprint $table) {
            $table->bigIncrements('idOrdencompra');
            $table->string('orcomfecha');
            $table->string('orcomhora');
            $table->string('orcomdescripcion')->nullable();
            $table->string('orcomtotal');
            $table->string('orcomestado');
            $table->unsignedBigInteger('idTipocomprobante');
            $table->foreign('idTipocomprobante')->references('idTipocomprobante')->on('tipo_comprobantes')->onDelete('cascade');
            $table->unsignedBigInteger('idTipopago');
            $table->foreign('idTipopago')->references('idTipopago')->on('tipo_pagos')->onDelete('cascade');
            $table->unsignedBigInteger('idProveedor');
            $table->foreign('idProveedor')->references('idProveedor')->on('proveedores')->onDelete('cascade');
            $table->unsignedBigInteger('idEmpleado');
            $table->foreign('idEmpleado')->references('idEmpleado')->on('empleados')->onDelete('cascade');

            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('compras');
    }
};
