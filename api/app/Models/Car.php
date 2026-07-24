<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    protected $guarded = [];
    protected $table = 'cars';
     public function user()
    {
        return $this->belongsToMany(User::class,'user_cars');
    }
    public function destinations()
    {
        return $this->hasMany(Destination::class);
    }


    public function user_car(){
        return $this->hasOne(user_car::class);
    }

}
