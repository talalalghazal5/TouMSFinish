<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Offer extends Model
{
    //
    protected $guarded=[];
    protected $table='offers';
            public function users(){
        return $this->belongsToMany(User::class,'user_offer');
    }
     public function tours(){
        return $this->belongsToMany(Tour::class,'tour_offer');
    }
}
