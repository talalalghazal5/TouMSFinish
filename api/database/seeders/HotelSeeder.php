<?php

namespace Database\Seeders;

use App\Models\Hotel;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class HotelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $hName = [
            'Romeo Hotel',
            'Grand Hotel Oriente',
            'Excelsior Hotel',
            'Bayerischer Hof',
            'Louis Hotel',
            'Hotel Adler',
            'Bristol Hotel',
            'Warsaw Marriott Hotel',
            'Sheraton Warsaw Hotel',
            'The Ritz-Carlton, Sydney',
            'Park Hyatt Sydney',
            'The Westin Sydney',
        ];



        $cName = [
            'Napoli',
            'Napoli',
            'Napoli',
            'Munich',
            'Munich',
            'Munich',
            'Warsaw',
            'Warsaw',
            'Warsaw',
            'Sydney',
            'Sydney',
            'Sydney',


        ];

        $hStatus = [
            'fivestars',
            'fourstars',
            'fivestars',
            'fivestars',
            'fourstars',
            'threetars',
            'fivestars',
            'fivestars',
            'fivestars',
            'fivestars',
            'fivestars',
            'fivestars',
        ];

        $rStatus = [
            'superperfect',
            'high',
            'superperfect',
            'superperfect',
            'high',
            'normal',
            'superperfect',
            'superperfect',
            'superperfect',
            'superperfect',
            'superperfect',
            'superperfect',
        ];




        $hPrice = [
            '350$ to 600$ ',
            '150$ to 250$ ',

            '200$ to 450$ ',
            '350$ to 600$ ',
            '200$ to 300$ ',
            '100$ to 150$ ',
            '200$ to 400$ ',
            '150$ to 250$ ',
            '150$ to 250$ ',
            '500$ to 800$ ',
            '700$ to 1200$ ',
            '300$ to 600$ ',
        ];
        $numofroom=[
            '100',
            '150',
            '200',
            '250',
            '300',
            '350',
            '300',
            '300',
            '400',
            '450',
            '500',
            '550',
        ];

        $image1=[
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
        ];
        $image2=[
           'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg'
        ];
        $image3=[
             'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
        ];
        $image4=[
           'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
            'YVf5rLeJmfYKAzX7Gf0eK43nV2sOfoCfiBxe4Ewz.jpg',
        ];



        for ($i = 0; $i < count($hName); $i++) {
            Hotel::create([
                'hotelName' => $hName[$i],

                'cityName' => $cName[$i],
                'hotelStatus' => $hStatus[$i],
                'roomStatus' => $rStatus[$i],

                'hotelDayPrice' => $hPrice[$i],
                'numOfRooms'=>$numofroom[$i],
                'image1'=>$image1[$i],
                'image2'=>$image2[$i],

                'image3'=>$image3[$i],

                'image4'=>$image4[$i],


            ]);
        }
    }
}
