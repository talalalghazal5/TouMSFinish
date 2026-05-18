<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Destination extends Model
{
    protected $guarded = [];
    protected $table = 'destinations';
    public function tours()
    {
        return $this->belongsToMany(Tour::class, 'tour_destination');
    }
    public function car()
    {
        return $this->belongsTo(Car::class);
    }
    public function touristguide()
    {
        return $this->hasOne(Touristguide::class);
    }
    public static function getDestinationByType($type)
    {
        return self::where('destinationType', $type)->get();
    }

    public static function getDestinationByName($destinationName)
    {
        return self::where('destinationName', $destinationName)->get();
    }
    public static function getDestinationByCountryName($country)
    {
        return self::where('country', $country)->get();
    }
    public function users()
    {
        return $this->belongsToMany(User::class, 'destination_user') ;
}
