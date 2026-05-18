<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Hotel extends Model
{
    protected $guarded = [];
    protected $table = 'hotels';

    public function bookings()
    {
        return $this->belongsToMany(Booking::class, 'booking_hotel');
    }
    public static function getHotelByCItyName($cityName)
    {
        return self::where('cityName', $cityName)->get();
    }
////////
public function scopeFiveStars($query)
    {
        return $query->where('hotelStatus', 'fivestars');
    }
}
