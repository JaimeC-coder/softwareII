<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TipoComprobante
 * softDeletes
 * @property $idTipocomprobante
 * @property $tcomcomprobante
 * @property $created_at
 * @property $updated_at
 * @property Ventas[] $ventas
 * @property Compra[] $compras
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class TipoComprobante extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'tipo_comprobantes';
    protected $primaryKey = 'idTipocomprobante';
    protected $fillable = ['tcomcomprobante'];

    public function ventas()
    {
        return $this->hasMany(Ventas::class, 'idTipocomprobante');
    }

    public function compras()
    {
        return $this->hasMany(Compra::class, 'idTipocomprobante');
    }
}
