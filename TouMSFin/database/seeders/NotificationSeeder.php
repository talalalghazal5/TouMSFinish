<?php

namespace Database\Seeders;

use App\Models\Not;
use App\Models\Thenotifications;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class NotificationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $mess = [
            'with perfect Enjoy the best offers available
            and seize your opportunity to travel to the most beautiful places. ',

            'Confirmation has been completed.',

        ];

        $notDate = [
            '2025-6-13',
            '2025-7-9',

        ];
         $notType = [
            'Internal',
            'Internal',

        ];
        for ($i = 0; $i < count($mess); $i++) {
            Thenotifications::create([
                'message' => $mess[$i],
                'notificationDate' => $notDate[$i],
                'notificationType'=>$notType[$i],

            ]);
        }
    }
}
