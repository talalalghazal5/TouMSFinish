<?php

namespace App\Listeners;

use App\Models\Profile;
use Illuminate\Auth\Events\Login;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class CreatProfile
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(Login $event): void
    {
        $user=$event->user;
        if (! $user->profile()->exists()) {
            $profile = Profile::create([
                'user_id' => $user->id,
                'phone' => null,
                'address'=>null,
                //'date-of-birth'=>null,
               // 'image'=>null,
            ]);
    }
}}
