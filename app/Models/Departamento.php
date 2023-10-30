<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Departamento
 * softDeletes
 * @property $idDepartamento
 * @property $depnombre
 * @property $created_at
 * @property $updated_at
 * @property Asistencia[] $asistencias
 * @property Empleado[] $empleados
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Departamento extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'departamentos';
    protected $primaryKey = 'idDepartamento';
    protected $fillable = [
        'depnombre'
    ];

    public function asistencias()
    {
        return $this->hasMany(Asistencia::class, 'idDepartamento');
    }

    public function empleados()
    {
        return $this->hasMany(Empleado::class, 'idDepartamento');
    }

}
