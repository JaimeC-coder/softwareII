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
        Schema::create('documentos', function (Blueprint $table) {
            $table->bigIncrements('idDocumento');
            $table->unsignedBigInteger('idTipoDocumento');
            $table->string('docnumero');
            $table->double('docmonto');
            $table->string('docsimbolo',1);
            $table->foreign('idTipoDocumento')->references('idTipoDocumento')->on('tipo_documentos')->onDelete('cascade');
            $table->unsignedBigInteger('documentable_id')->nullable();
            $table->string('documentable_type')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('documentos');
    }
};
