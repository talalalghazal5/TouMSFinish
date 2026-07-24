<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class user_hotel extends Model
{

    protected $fillable=['user_id','hotel_id','bookingStatus','bookingDate','numberOfRooms','numberOfDays','total_price_hotel'];

    protected $table='user_hotels';
     public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function hotel()
    {
        return $this->belongsTo(Hotel::class);
    }
}
