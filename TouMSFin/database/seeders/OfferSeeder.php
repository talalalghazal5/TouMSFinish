<?php

namespace Database\Seeders;

use App\Models\Offer;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class OfferSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
          $offerDescrs = [
            'The best offer in the tourism world',
            'enjoy your trip with this offer'
        ];

        $disc = [
            '16%',
            '13% days',
        ];

        $stDate= [
            '2025-9-26',
            '2025-12-1',

        ];

        $endDate = [
            '2025-11-8',
            '2025-12-1',
        ];


        for ($i = 0; $i < count($offerDescrs); $i++) {
            Offer::create([
                'offerDescription' => $offerDescrs[$i],
                'discountParcentage' => $disc[$i],
                'startDate' => $stDate[$i],
                'endDate' => $endDate[$i],
            ]);
    }
    }
}
