<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $guarded = [];
    protected $table = 'reviews';
    // public function user()
    // {
    //     return $this->belongsTo(User::class);
    // }
    public function tours()
    {
        return $this->belongsToMany(Tour::class,'tour_review');
    }
    public function users()
    {
        return $this->belongsToMany(User::class,'user_review');
    }
}
