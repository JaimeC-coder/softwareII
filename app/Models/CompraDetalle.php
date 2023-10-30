<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class CompraDetalle
 * softDeletes
 * @property $idDetallecompra
 * @property $idOrdencompra
 * @property $idProducto
 * @property $dcomcantidad
 * @property $created_at
 * @property $updated_at
 * @property Compra $compra
 * @property Producto $producto
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 *
 */

class CompraDetalle extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'compra_detalles';
    protected $primaryKey = 'idDetallecompra';
    protected $fillable = ['idOrdencompra','idProducto','dcomcantidad'];

    public function compra()
    {
        return $this->belongsTo(Compra::class, 'idOrdencompra');
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'idProducto');
    }

}
