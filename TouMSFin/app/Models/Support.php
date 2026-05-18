<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Support extends Model
{
    protected $guarded = [];
    protected $table = 'supports';
    public function users()
    {
        return $this->belongsToMany(User::class, 'user_support');
    }
}
