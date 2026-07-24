<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class user_flight extends Model
{

    protected $fillable=['user_id','flight_id','bookingStatus','bookingDate','numbers','total_price_flight'];
    protected $table='user_flights';
     public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function flight()
    {
        return $this->belongsTo(Flight::class);
    }

     public function canbooking($seats)
    {
        return $this->numOfSeats >= $seats;
    }

    public function booking($seats)
    {
        if (!$this->canbooking($seats)) {
            throw new \Exception("لا يوجد مقاعد.");
        }

        $this->numOfSeats -= $seats;
        $this->save();
    }
}
