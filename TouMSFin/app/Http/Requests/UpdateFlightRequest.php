<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateFlightRequest extends FormRequest
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


            'flightNumber' => 'sometimes|required|integer',
            'departureTime' => 'sometimes|required|string',
            'From' => 'sometimes|required|string',
            'To' => 'sometimes|required|string',
            'departureDate' => 'sometimes|required|date',

            'arrivalTime' => 'sometimes|required|string',
            'flightPrice' => 'sometimes|required|string',
            'departureAirport' => 'sometimes|required|string',
            'landingAirport' => 'sometimes|required|string',
            'numOfSeats' => 'sometimes|required|integer',
        ];
    }
}
