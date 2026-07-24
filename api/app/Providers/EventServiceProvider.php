<?php

namespace App\Providers;

use App\Listeners\CreatProfile;
use Illuminate\Support\ServiceProvider;
use Illuminate\Auth\Events\Login;
use App\Listeners\CreateWallet;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
    Login::class => [
        CreateWallet::class,
        CreatProfile::class,
    ],
];
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}
