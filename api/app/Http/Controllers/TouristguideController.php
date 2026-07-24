<?php

namespace App\Http\Controllers;

use App\Http\Requests\TouristGuideRequest;
use App\Models\Touristguide;
use Illuminate\Http\Request;

class TouristguideController extends Controller
{
    public function show($id)
    {

        $touristguide = Touristguide::where('destination_id', $id)->firstOrfail();
        return response()->json(['the required touristGuide:' => $touristguide], 200);
    }



    public function store(TouristGuideRequest $request)
    {
        $touristguide = Touristguide::create($request->validated());
        return response()->json([
            'message:' => 'TouristGuide will be ready to participate with you on your trip',
            'profile:' => $touristguide,
        ], 201);
    }
}
