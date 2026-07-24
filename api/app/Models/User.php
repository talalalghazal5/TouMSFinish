<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Models\Notification as ModelsNotification;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Notifications\Notification;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
    public function profile()
    {
        return $this->hasOne(Profile::class);
    }

    public function reviews()
    {
        return $this->belongsToMany(Review::class, 'user_review');
    }

    public function tours()
    {
        return $this->belongsToMany(Tour::class, 'user_tours');
    }
    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }


     public function payment()
    {
        return $this->hasMany(Payment::class);
    }
    public function flights()
    {
        return $this->belongsToMany(Flight::class,'user_flights');
    }

    public function hotels()
    {
        return $this->belongsToMany(Hotel::class,'user_hotels');
    }
    public function cars()
    {
        return $this->belongsToMany(Car::class,'user_cars');
    }
        public function wallet()
{
    return $this->hasOne(Wallet::class);
}

    public function favoriteTours()
    {

        return $this->belongsToMany(Tour::class, 'favorites');
    }
    public function supports()
    {
        return $this->belongsToMany(Support::class, 'user_support');
    }
}
