<?php

use App\Http\Controllers\DashboardController;
use Illuminate\Support\Facades\Route;
use App\Http\Middleware\CheckUserRole;
use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;






Route::get('/', function () {
    return view('welcome');
});
