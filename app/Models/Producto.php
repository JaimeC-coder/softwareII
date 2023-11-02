<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Producto
 * softDetetes
 * @property $idProducto
 * @property $pronombre
 * @property $prodescripcion
 * @property $propreciounitario
 * @property $propreciocompra
 * @property $prostock
 * @property $prostockminimo
 * @property $idTipoproducto
 * @property $idUnidadmedida
 * @property $created_at
 * @property $updated_at
 * @property $deleted_at
 *
 * @property DetalleVenta[] $detalleVentas
 * @property Detallecompra[] $detallecompras
 * @property Tipoproducto $tipoproducto
 * @property UnidadMedida $unidadMedida
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */


class Producto extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'productos';
    protected $primaryKey = 'idProducto';
    protected $fillable = ['pronombre','prodescripcion','propreciounitario','propreciocompra','prostock','prostockminimo','idTipoproducto','idUnidadmedida'];




    public function detalleVentas()
    {
        return $this->hasMany(DetalleVenta::class, 'idProducto');
    }

    public function detallecompras()
    {
        return $this->hasMany(Detallecompra::class, 'idProducto');
    }

    public function tipoproducto()
    {
        return $this->belongsTo(Tipoproducto::class, 'idTipoproducto');
    }

    public function unidadMedida()
    {
        return $this->belongsTo(UnidadMedidas::class, 'idUnidadmedida');
    }

}
