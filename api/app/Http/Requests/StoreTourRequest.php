<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreTourRequest extends FormRequest
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

            'tourName' => 'required|string|max:40',
            'duration' => 'required|string',
            'tourPrice' => 'required|string',
            'tourDescription' => 'required|string|max:900',
            'image'=>'required|image|mimes:png,jpg,jpeg,gif|max:2048',
        ];
    }
}
