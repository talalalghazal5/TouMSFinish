<?php

namespace Database\Seeders;

use App\Models\Tour;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TourSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tourNames = [
            'Italy',
            'Germany',
            'Poland',
            'Australia',
        ];

        $durations = [
            '32 days',
            // '15 days',
            '9 days',
            // '32 days',
            // '22 days',
            '7 weeks',
            '10 days',
            // 'one month',
        ];

        $tprices = [
            '1400$',
            '1150$',
            '950$',
            '900$',

        ];

        $tourDescrs = [

            'go to historical ancient places in Italy,see some sides of  the large civlisation of the country,
             enjoy with beautiful views.',
            'Full Activities,very large trips and differnt places to visit and see.',
            'This Tour is not happen every time,with evry thing you want to do .',
            'Australlia is the country of Tourism in the world,select this tour and go in this experience.',
        ];



        for ($i = 0; $i < count($tourNames); $i++) {
            Tour::create([
                'tourName' => $tourNames[$i],
                'duration' => $durations[$i],
                'tourPrice' => $tprices[$i],
                'tourDescription' => $tourDescrs[$i],

            ]);
        }
    }
}
