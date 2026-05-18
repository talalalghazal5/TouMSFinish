<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tour extends Model
{

    protected $guarded=[];
    protected $table = 'tours';
    protected $casts = [
        'tourPrice' => 'decimal:2',
    ];
    public function users()
    {
        return $this->belongsToMany(User::class, 'user_tour');
    }

    public function bookings()
    {
        return $this->belongsToMany(Booking::class, 'tour_booking');
    }
    public function destinations()
    {
        return $this->belongsToMany(Destination::class, 'tour_destination');
    }
    public function favoriteByUser()
    {

        return $this->belongsToMany(User::class, 'favorites');
    }
    public function offers()
    {
        return $this->belongsToMany(Offer::class, 'tour_offer');
    }
    public function reviews()
    {
        return $this->belongsToMany(Review::class,'tour_review');
    }


    //
    public static function toursWithOffers()
    {
        return self::has('offers')->get();
    }
    public static function getTourName($tourName)
    {
        return self::where('tourName', $tourName)->get();
    }
}
