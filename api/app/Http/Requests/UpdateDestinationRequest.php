<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateDestinationRequest extends FormRequest
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
            'destinationType' => 'sometimes|required|in:entertainment,historical,variety',
            'destinationName' => 'sometimes|required|string',
            'description' => 'sometimes|required|string',
            'country' => 'sometimes|required|string',
            'image1'=>'sometimes|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image2'=>'sometimes|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image3'=>'sometimes|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image4'=>'sometimes|image|mimes:png,jpg,jpeg,gif|max:2048',

        ];
    }
}
