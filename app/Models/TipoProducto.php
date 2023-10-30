<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class TipoProducto
 * softDeletes
 * @property $idTipoproducto
 * @property $tpronombre
 * @property $created_at
 * @property $updated_at
 * @property Producto[] $productos
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder<
 */

class TipoProducto extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'tipo_productos';
    protected $primaryKey = 'idTipoproducto';
    protected $fillable = [
        'tpronombre'
    ];

    public function productos()
    {
        return $this->hasMany(Producto::class, 'idTipoproducto');
    }
}
