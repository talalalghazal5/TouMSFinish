<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    protected $guarded=[];
    protected $table='flights';

 public function bookings()
    {
        return $this->belongsToMany(Booking::class,'booking_flight');
    }
     public function users()
    {
        return $this->belongsToMany(User::class,'user_flights');
    }

    public function user_flight(){
        return $this->hasone(user_flight::class);
    }

    public function canBookingSeats($seats)
    {
        return $this->numOfSeats >= $seats;
    }

    public function bookingSeats($seats)
    {
        if (!$this->canBookingSeats($seats)) {
            throw new \Exception("لا يوجد مقاعد.");
        }

        $this->numOfSeats -= $seats;
        $this->save();
    }

}
