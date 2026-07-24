<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class user_tour extends Model
{

    protected $fillable=['user_id','tour_id','numbers','total_price_tour'];

protected $table='user_tours';
//  public function user()
//     {
//         return $this->belongsTo(User::class);
//     }
    // public function tour()
    // {
    //     return $this->belongsTo(Tour::class);
    // }
}
