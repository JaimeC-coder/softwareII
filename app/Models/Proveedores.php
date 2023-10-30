<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Proveedores
 * softDeletes
 * @property $idProveedor
 * @property $provdoc
 * @property $provtelefono
 * @property $provcorreo
 * @property $provdireccion
 * @property $provrazonsocial
 * @property $created_at
 * @property $updated_at
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 *
 * @property Compra[] $compras
 */
class Proveedores extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'proveedores';
    protected $primaryKey = 'idProveedor';
    protected $fillable = ['provdoc','provtelefono','provcorreo','provdireccion','provrazonsocial'];

    public function compras()
    {
        return $this->hasMany(Compra::class, 'idProveedor');
    }

}
