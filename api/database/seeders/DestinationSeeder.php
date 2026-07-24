<?php

namespace Database\Seeders;

use App\Models\Destination;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DestinationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $dName = [
            'Pompeii',
            'Capri',
            'Amalfi Coast',
            'Mount Vesuvius',
            'Neuschwanstein and Hohenschwangau Castles',
            'Lake Constance',
            'Bavarian Forest',
            'Salzburg',
            'Kraków',
            'Auschwitz-Birkenau',
            'Masurian Lakes',
            'Białowieża Forest',
            'Blue Mountains',
            'Jervis Bay',
            'Newcastle',
            'Phillip Island',
        ];



        $descr = [
            'An ancient historical city discovered after the eruption of Mount Vesuvius.',

            ' A beautiful island in the Tyrrhenian Sea with stunning views and wonderful beaches
            , as well as caves such as the famous "Blue Caves".',

            ' One of the most beautiful coastlines in the world
            , with coastal towns like Amalfi, Positano and Ravello, stunning mountains and enchanting beaches.',

            'An active volcano offering stunning views of the Bay of Naples.',

            'Stunning castles in the Alps, some of the most famous and visited in Europe.',

            'A beautiful lake located on the border between Germany,
            Switzerland and Austria, with many wonderful towns such as Frauenkirch and Baden-Wil.',

            'A large nature reserve offering stunning views for walking and cycling in nature,
            ideal for outdoor enthusiasts.',

            'The city of music and arts, Mozarts birthplace, contains wonderful historical and cultural attractions.',

            ' One of the oldest and most beautiful cities in Poland,
            it features historical landmarks such as the Main Market Square and Wawel Castle.',

            'The infamous Nazi concentration camp in Auschwitz is one of the most important historical sites in the world.',

            'An area with several interconnected lakes,
            it is an ideal destination for water activities such as boating and swimming.',

            'One of the oldest primeval forests in Europe,
            it is home to many wild species such as the European bison.',

            'Located about two hours from Sydney,
            it boasts stunning scenery, with wooded hills and waterfalls.',

            'A beautiful bay offering beaches with clear waters and white sand,
            it is an ideal place for swimming and diving.',

            'A coastal city north of Sydney,
            known for its beautiful beaches, peaceful atmosphere, and diverse local culture.',

            'An island known for its penguin colonies, it is a great place for wildlife viewing and water activities.',


        ];

        $countryD = [
            'Italy',
            'Italy',
            'Italy',
            'Italy',
            'Germany',
            'Germany',
            'Germany',
            'Germany',

            'Ploand',
            'Poland',
            'Poland',
            'Poland',
            'Australlia',
            'Australlia',
            'Australlia',
            'Australlia',
        ];

        $desType = [
            'historical',
            'variety',
            'entertainment',
            'historical',
            'historical',
            'variety',
            'entertainment',
            'variety',
            'historical',
            'historical',
            'variety',
            'variety',
            'entertainment',
            'entertainment',
            'entertainment',
            'historical',

        ];






        for ($i = 0; $i < count($dName); $i++) {
            Destination::create([


                'destinationName' => $dName[$i],
                'description' => $descr[$i],
                'country' => $countryD[$i],
                'destinationType' => $desType[$i],

            ]);
        }
    }
}
