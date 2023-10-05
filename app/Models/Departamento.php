<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Departamento
 *
 * @property $idDepartamento
 * @property $depnombre
 * @property $created_at
 * @property $updated_at
 *
 * @property Asistencia[] $asistencias
 * @property Empleado[] $empleados
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Departamento extends Model
{
    use HasFactory;

    protected $table = 'departamentos';
    protected $primaryKey = 'idDepartamento';
    protected $fillable = [
        'depnombre'
    ];

}
