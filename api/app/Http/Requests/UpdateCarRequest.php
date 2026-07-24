<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateCarRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'pickUpLocation' => 'sometimes|required|string',
            'pickupTime' => 'sometimes|required|string',
            'dropOffLocation' => 'sometimes|required|string',
            'pickdate' => 'sometimes|required|date',
        ];
    }
}
