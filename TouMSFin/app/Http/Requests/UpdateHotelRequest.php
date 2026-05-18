<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateHotelRequest extends FormRequest
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
            'hotelName' => 'sometimes|required|string',

            'hotelDayPrice' => 'sometimes|required|string',
            'hotelStatus' => 'sometimes|required|in:threestars,fourstars,fivestars',
            'roomStatus' => 'sometimes|required|in:normal,high,superperfect',
            'cityName' => 'sometimes|required|string',
            'image1' => 'sometimes|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image2' => 'sometimes|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image3' => 'sometimes|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image4' => 'sometimes|image|mimes:png,jpg,jpeg,gif|max:2048',
        ];
    }
}
