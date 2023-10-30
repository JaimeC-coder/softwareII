<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TipoDocumento
 * softDeletes
 * @property $idTipoDocumento
 * @property $tidDocumento
 * @property $created_at
 * @property $updated_at
 * @property Documento[] $documentos
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class TipoDocumento extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'tipo_documentos';
    protected $primaryKey = 'idTipoDocumento';
    protected $fillable = ['tidDocumento'];

    public function documentos()
    {
        return $this->hasMany(Documento::class, 'idTipoDocumento');
    }
}
