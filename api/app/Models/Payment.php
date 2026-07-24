<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $guarded=['id'];
    protected $table='payments';
    public function booking()
    {
        return $this->belongsTo(Booking::class);
    }
        public function plus($user_id){
       // $user_id=Auth::user()->id;
        $flights = user_flight::where('user_id', $user_id)->get();
        $total_price_flight = 0;

        for ($i = 0; $i < count($flights); $i++) {
        $total_price_flight += $flights[$i]->total_price_flight;
    }
     $hotels = user_hotel::where('user_id', $user_id)->get();
        $total_price_hotel = 0;

        for ($i = 0; $i < count($hotels); $i++) {
        $total_price_hotel += $hotels[$i]->total_price_hotel;
    }
     $tours = user_tour::where('user_id', $user_id)->get();
        $total_price_tour = 0;

        for ($i = 0; $i < count($tours); $i++) {
        $total_price_tour += $tours[$i]->total_price_tour;
    }
    $total_price=$total_price_flight+$total_price_hotel+$total_price_tour;
    $paymants=Payment::create([
        'user_id'=>$user_id,
        'total_price_fligth'=>$total_price_flight,
        'total_price_hotel'=>$total_price_hotel,
        'total_price_tour'=>$total_price_tour,
        'total_price'=>$total_price]);

return response()->json();
}
}
