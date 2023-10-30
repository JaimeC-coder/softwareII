<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TipoPago
 * softDeletes
 * @property $idTipopago
 * @property $tpagotipo
 * @property $created_at
 * @property $updated_at
 * @property Ventas[] $ventas
 * @property Compra[] $compras
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class TipoPago extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'tipo_pagos';
    protected $primaryKey = 'idTipopago';
    protected $fillable = ['tpagotipo'];

    public function ventas()
    {
        return $this->hasMany(Ventas::class, 'idTipopago');
    }

    public function compras()
    {
        return $this->hasMany(Compra::class, 'idTipopago');
    }

}
