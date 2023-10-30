<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class VentaDetalle
 * softDeletes
 * @property $idDventa
 * @property $idVenta
 * @property $idProducto
 * @property $dvcantidad
 * @property $dvpreciounitario
 * @property $created_at
 * @property $updated_at
 * @property Venta $venta
 * @property Producto $producto
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class VentaDetalle extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'venta_detalles';
    protected $primaryKey = 'idDventa';
    protected $fillable = ['idVenta','idProducto','dvcantidad','dvpreciounitario'];

    public function venta()
    {
        return $this->belongsTo(Venta::class, 'idVenta');
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'idProducto');
    }

    
}
