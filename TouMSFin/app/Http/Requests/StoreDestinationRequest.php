<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreDestinationRequest extends FormRequest
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
            'destinationType' => 'required|in:entertainment,historical,variety',
            'destinationName' => 'required|string',
            'description' => 'required|string',
            'country' => 'required|string',
            'image1'=>'required|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image2'=>'required|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image3'=>'required|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image4'=>'required|image|mimes:png,jpg,jpeg,gif|max:2048',


        ];
    }
}
