<?php

namespace Database\Seeders;

use App\Models\Support;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SupportSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
         $rd = [
            'how to change my password?',

            'how to chooze tour?',

            'what about carHire?',

        ];

        $rt = [
            'FAQ',
            'FAQ',
            'proplem',

        ];

         $rR = [
            'go to login page,click on forgotten my password ,then enter the new passord.',
            'go to home page,the search about atrip you want.',
            'just determine the pickupLocation and the dropOff Location then the car wiil drive you.',

        ];
        for ($i = 0; $i < count($rd); $i++) {
            Support::create([
                'requestDescription' => $rd[$i],
                'requestType' => $rt[$i],
                'requestResponse' => $rR[$i],

            ]);
        }
    }
}
