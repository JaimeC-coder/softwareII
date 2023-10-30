<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Capacitacion
 * softDeletes
 * @property $idCapacitacion
 * @property $capfechainicio
 * @property $capfechafin
 * @property $capcapacitador
 * @property $idDepartamento
 * @property $created_at
 * @property $updated_at
 * @property Departamento $departamento
 * @property Asistencia[] $asistencias
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Capacitacion extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'capacitacions';
    protected $primaryKey = 'idCapacitacion';
    protected $fillable = ['capfechainicio','capfechafin','capcapacitador','idDepartamento'];

    public function departamento()
    {
        return $this->belongsTo(Departamento::class, 'idDepartamento');
    }

    public function asistencias()
    {
        return $this->hasMany(Asistencia::class, 'idCapacitacion');
    }

    
}
