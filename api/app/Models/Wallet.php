<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Wallet extends Model
{
     protected $fillable = ['user_id', 'balance'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function deposit($amount)
    {
        $this->balance += $amount;
        $this->save();
    }

    public function canPay($amount)
    {
        return $this->balance >= $amount;
    }

    public function pay($amount)
    {
        if (!$this->canPay($amount)) {
            throw new \Exception("الرصيد غير كافٍ في المحفظة.");
        }

        $this->balance -= $amount;
        $this->save();
    }
}
