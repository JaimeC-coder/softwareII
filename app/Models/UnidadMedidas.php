<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class UnidadMedidas
 * softDeletes
 * @property $idUnidadmedida
 * @property $umednombre
 * @property $created_at
 * @property $updated_at
 * @property Producto[] $productos
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class UnidadMedidas extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'unidad_medidas';
    protected $primaryKey = 'idUnidadmedida';
    protected $fillable = [
        'umednombre'
    ];

    public function productos()
    {
        return $this->hasMany(Producto::class, 'idUnidadmedida');
    }

}
