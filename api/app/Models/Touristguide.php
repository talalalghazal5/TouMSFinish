<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Touristguide extends Model
{
    protected $guarded=[];
    protected $table='touristguides';

    public function destination()
    {
        return $this->belongsTo(Destination::class);
    }
}
