<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Asistencia
 * softDeletes
 * @property $idAsistencia
 * @property $idEmpleado
 * @property $idCapacitacion
 * @property $idDepartamento
 * @property $asistio ['si', 'no', 'justifico']
 * @property $justificacion
 * @property $created_at
 * @property $updated_at
 *
 * @property Empleado $empleado
 * @property Capacitacion $capacitacion
 * @property Departamento $departamento
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Asistencia extends Model
{
    use SoftDeletes;
    use HasFactory;

    protected $table = 'asistencias';
    protected $primaryKey = 'idAsistencia';
    protected $fillable = ['idEmpleado','idCapacitacion','idDepartamento','asistio','justificacion'];

    public function empleado()
    {
        return $this->belongsTo(Empleado::class, 'idEmpleado');
    }

    public function capacitacion()
    {
        return $this->belongsTo(Capacitacion::class, 'idCapacitacion');
    }

    public function departamento()
    {
        return $this->belongsTo(Departamento::class, 'idDepartamento');
    }


}
