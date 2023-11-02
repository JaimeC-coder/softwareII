<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Compra
 * softDeletes
 * @property $idOrdencompra
 * @property $orcomfecha
 * @property $orcomhora
 * @property $orcomdescripcion
 * @property $orcomtotal
 * @property $idTipocomprobante
 * @property $idTipopago
 * @property $idProveedor
 * @property $idEmpleado
 * @property $created_at
 * @property $updated_at
 * @property TipoComprobante $tipoComprobante
 * @property TipoPago $tipoPago
 * @property Proveedor $proveedor
 * @property Empleado $empleado
 * @property CompraDetalle[] $compraDetalles
 * @property Documento[] $documentos
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Compra extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'compras';
    protected $primaryKey = 'idOrdencompra';
    protected $fillable = ['orcomfecha','orcomhora','orcomdescripcion','orcomestado','orcomtotal','idTipocomprobante','idTipopago','idProveedor','idEmpleado'];

    public function tipoComprobante()
    {
        return $this->belongsTo(TipoComprobante::class, 'idTipocomprobante');
    }

    public function tipoPago()
    {
        return $this->belongsTo(TipoPago::class, 'idTipopago');
    }

    public function proveedor()
    {
        return $this->belongsTo(Proveedores::class, 'idProveedor');
    }

    public function empleado()
    {
        return $this->belongsTo(Empleado::class, 'idEmpleado');
    }

    public function compraDetalles()
    {
        return $this->hasMany(CompraDetalle::class, 'idOrdencompra');
    }

    public function documentos()
    {
        return $this->morphOne(Documento::class, 'documentable');
    }


}
