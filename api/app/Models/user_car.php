<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class user_car extends Model
{
    protected $fillable=['user_id','car_id','bookingStatus','bookingDate','numbers','total_price_car'];
    protected $table='user_cars';
     public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function car()
    {
        return $this->belongsTo(Car::class);
    }
}
