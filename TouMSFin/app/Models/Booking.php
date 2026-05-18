<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $fillable = ['bookingDate', 'bookingStatus', 'totalPrice','user_id','numbers','bookingFor'];
    protected $table = 'bookings';
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function payment()
    {
        return $this->hasOne(Payment::class);
    }
    public function flights()
    {
        return $this->belongsToMany(Flight::class,'booking_flight');
    }
    public function tours(){
        return $this->belongsToMany(Tour::class,'tour_booking');
    }

     public function hotels()
    {
        return $this->belongsToMany(Hotel::class,'booking_hotel');
    }
    public function cars()
    {
        return $this->hasMany(Car::class);
    }
}
