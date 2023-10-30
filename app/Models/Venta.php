<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Venta
 * softDeletes
 * @property $idVenta
 * @property $venfecha
 * @property $venhora
 * @property $vendescripcion
 * @property $ventotal
 * @property $idTipocomprobante
 * @property $idTipopago
 * @property $idEmpleado
 * @property $created_at
 * @property $updated_at
 * @property TipoComprobante $tipoComprobante
 * @property TipoPago $tipoPago
 * @property Empleado $empleado
 * @property VentaDetalle[] $ventaDetalles
 * @property Documento[] $documentos
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Venta extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'ventas';
    protected $primaryKey = 'idVenta';
    protected $fillable = [
        'venfecha',
        'vendocumentocliente',
        'venhora',
        'venestado',
        'venmonto',
        'venimpuesto',
        'ventotalneto',
        'venobservacion',
        'idTipocomprobante',
        'idTipopago',
        'idEmpleado'
    ];

    public function tipoComprobante()
    {
        return $this->belongsTo(TipoComprobante::class, 'idTipocomprobante');
    }


    public function tipoPago()
    {
        return $this->belongsTo(TipoPago::class, 'idTipopago');
    }


    public function empleado()
    {
        return $this->belongsTo(Empleado::class, 'idEmpleado');
    }

    public function ventaDetalles()
    {
        return $this->hasMany(VentaDetalle::class, 'idVenta');
    }

    public function documentos()
    {
        return $this->morphOne(Documento::class, 'documentable');
    }
}
