<?php

namespace Database\Seeders;

use App\Models\Flight;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class FlightSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $flightNum = [
            '1',
            '2',
            '3',
            '4',
        ];
        $from = [
            'UAE',
            'Egypt',
            'Syria',
            'Iraq',
        ];
        $to = [
            'Italy',
            'Germany',
            'Poland',
            'Australlia',
        ];

        $depD = [
            '2025-09-18',
            '2025-10-19',
            '2025-11-20',
            '2025-12-21',
        ];


        $depTime = [
            '1:00',
            '3:30',
            '5:15',
            '7:45',


        ];
        $numSeats = [
            '250',
            '400',
            '350',
            '200',


        ];

        $arriTime = [
            '4:20',
            '6:50',
            '8:25',
            '11:05',
        ];

        $fPrice = [
            '100$',
            '400$',
            '300$',
            '200$',
        ];

        $depAirport = [
            'DXB',
            'CAI',
            'DAM',
            'BGW',
        ];

        $lanAirport = [
            'NAP',
            'MUC',
            'WAW',
            'SYD',
        ];


        for ($i = 0; $i < count($flightNum); $i++) {
            Flight::create([
                'flightNumber' => $flightNum[$i],

                'departureTime' => $depTime[$i],
                'From' => $from[$i],
                'To' => $to[$i],
                'departureDate' => $depD[$i],
                'numOfSeats' => $numSeats[$i],
                'arrivalTime' => $arriTime[$i],
                'flightPrice' => $fPrice[$i],
                'departureAirport' => $depAirport[$i],
                'LandingAirport' => $lanAirport[$i],
            ]);
        }
    }
}
