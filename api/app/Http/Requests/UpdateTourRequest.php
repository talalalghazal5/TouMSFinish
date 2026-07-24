<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateTourRequest extends FormRequest
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
            'tourName' => 'sometimes|required|string|max:40',
            'duration' => 'sometimes|required|string',
            'tourPrice' => 'sometimes|required|string',
            'tourDescription' => 'sometimes|required|string|max:900',
            'image' => 'sometimes|required|image|mimes:png,jpg,jpeg,gif|max:2048',
        ];
    }
}
