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

}
