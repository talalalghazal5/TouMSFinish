<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreFlightRequest extends FormRequest
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

            'flightNumber' => 'required|integer|max:10',
            'departureTime' => 'required|string',
            'From' => 'required|string',
            'To' => 'required|string',
            'departureDate' => 'required|date',

            'arrivalTime' => 'required|string',
            'flightPrice' => 'required|string',
            'departureAirport' => 'required|string',
            'landingAirport' => 'required|string',
            'numOfSeats' => 'required|integer',
        ];
    }
}
