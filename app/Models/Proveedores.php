<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/*
*
* @property int $idProveedor
* @property string $provdoc
* @property string $provtelefono
* @property string $provcorreo
* @property string $provdireccion
* @property string $provrazonsocial

*/
class Proveedores extends Model
{
    use HasFactory;

    use SoftDeletes;

    protected $table = 'proveedores';
    protected $primaryKey = 'idProveedor';
    protected $fillable = [
        'provdoc',
        'provtelefono',
        'provcorreo',
        'provdireccion',
        'provrazonsocial'
    ];
}
