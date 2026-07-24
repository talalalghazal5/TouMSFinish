<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class TouristGuideR
{

    public function handle(Request $request, Closure $next): Response
    {
        if (Auth::user()->role === 'touristguide')
        return $next($request);
        return response()->json(['unauthorized,this for TouristGuides'],403);

}
}
