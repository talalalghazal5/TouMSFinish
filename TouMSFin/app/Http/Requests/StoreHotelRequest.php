<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreHotelRequest extends FormRequest
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


            'hotelName' => 'required|string',

            'hotelDayPrice' => 'required|string',
            'hotelStatus' => 'required|in:threestars,fourstars,fivestars',
            'roomStatus' => 'required|in:normal,high,superperfect',
            'cityName' => 'required|string',
            'image1'=>'required|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image2'=>'required|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image3'=>'required|image|mimes:png,jpg,jpeg,gif|max:2048',
            'image4'=>'required|image|mimes:png,jpg,jpeg,gif|max:2048',

        ];
    }
}
