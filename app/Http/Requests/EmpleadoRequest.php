<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmpleadoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $rules = [
            // 'nombre' => 'required',
            // 'apellido' => 'required',
            // 'cedula' => 'required',
            // 'telefono' => 'required',
            // 'direccion' => 'required',
            // 'email' => 'required',
            // 'password' => 'required',
            // 'rol_id' => 'required',
        ];


        return $rules;
    }
}
