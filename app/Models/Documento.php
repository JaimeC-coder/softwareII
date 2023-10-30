<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Documento
 * softDeletes
 * @property $idDocumento
 * @property $idTipoDocumento
 * @property $docnumero
 * @property $docmonto
 * @property $docsimbolo
 * @property $documentable_id
 * @property $documentable_type
 * @property $created_at
 * @property $updated_at
 * @property TipoDocumento $tipoDocumento
 * @property Compra $compra
 * @property Venta $venta
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Documento extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'documentos';
    protected $primaryKey = 'idDocumento';
    protected $fillable = ['idTipoDocumento','docnumero','docmonto','docsimbolo','documentable_id','documentable_type'];

    public function tipoDocumento()
    {
        return $this->belongsTo(TipoDocumento::class, 'idTipoDocumento');
    }

    public function documentable()
    {
        return $this->morphTo();
    }

    public function compra()
    {
        return $this->belongsTo(Compra::class, 'documentable_id');
    }

    public function venta()
    {
        return $this->belongsTo(Venta::class, 'documentable_id');
    }


}
