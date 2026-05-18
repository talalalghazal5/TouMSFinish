<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Thenotifications extends Model
{

     protected $guarded=[];
    protected $table='thenotifications';
    public function users()
    {
        return $this->belongsToMany(User::class,'user_thenotifications');
    }
}
