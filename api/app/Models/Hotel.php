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

    public function user()
    {
        return $this->belongsToMany(User::class,'user_hotels');
    }

    public function user_hotel(){
        return $this->hasOne(user_hotel::class);
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

    public function canBookingRooms($rooms)
    {
        return $this->numOfRooms >= $rooms;
    }

    public function bookingRooms($rooms)
    {
        if (!$this->canBookingRooms($rooms)) {
            throw new \Exception("لا يوجد غرف.");
        }

        $this->numOfRooms -= $rooms;
        $this->save();
    }
}
