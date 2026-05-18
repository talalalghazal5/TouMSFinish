<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    protected $guarded = [];
    protected $table = 'cars';
    public function booking()
    {
        return $this->belongsTo(Booking::class);
    }
    public function destinations()
    {
        return $this->hasMany(Destination::class);
    }
}
