<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


/**
 * Class Empleado
 * softDeletes
 * @property $idEmpleado
 * @property $empnombres
 * @property $empapellidop
 * @property $empapellidom
 * @property $empdni
 * @property $empdireccion
 * @property $emptelefono
 * @property $idDepartamento
 * @property $idUser
 * @property $created_at
 * @property $updated_at
 *
 * @property Asistencia[] $asistencias
 * @property Departamento $departamento
 * @property DocumentosContable[] $documentosContables
 * @property OrdenCompra[] $ordenCompras
 * @property User $user
 * @property Venta[] $ventas
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Empleado extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'empleados';
    protected $primaryKey = 'idEmpleado';
    protected $fillable = [
        'empnombres',
        'empapellidop',
        'empapellidom',
        'empdni',
        'empdireccion',
        'emptelefono',
        'idDepartamento',
        'idUser'
    ];

    public function asistencias()
    {
        return $this->hasMany(Asistencia::class, 'idEmpleado');
    }

    public function departamento()
    {
        return $this->belongsTo(Departamento::class, 'idDepartamento');
    }

    public function documentosContables()
    {
        return $this->hasMany(DocumentosContable::class, 'idEmpleado');
    }

    public function ordenCompras()
    {
        return $this->hasMany(OrdenCompra::class, 'idEmpleado');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'idUser');
    }

    public function ventas()
    {
        return $this->hasMany(Venta::class, 'idEmpleado');
    }




}
