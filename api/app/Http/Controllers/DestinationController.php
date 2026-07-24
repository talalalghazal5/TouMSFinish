<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreDestinationRequest;
use App\Http\Requests\UpdateDestinationRequest;
use App\Models\Destination;
use App\Models\Tour;
use App\Models\Touristguide;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;

class DestinationController extends Controller
{

    public function store(StoreDestinationRequest $request)
    {

        $validateData = $request->validated();


        if ($request->hasFile('image1')) {

            $path = $request->file('image1')->store('Destination_photo', 'public');
            $validateData['image1'] = $path;
        }
        if ($request->hasFile('image2')) {
            $validateData['image2'] = $request->file('image2')->store('Destination_photo', 'public');
        }
        if ($request->hasFile('image3')) {
            $validateData['image3'] = $request->file('image3')->store('Destination_photo', 'public');
        }
        if ($request->hasFile('image4')) {
            $validateData['image4'] = $request->file('image4')->store('Destination_photo', 'public');
        }
        $destination = Destination::create($validateData);
        return response()->json([
                'message' => 'Destination Added successfully',
                'data'    => $destination
            ], 201);
    }
    ////AllDestination
    public function index()
    {
        $destination = Destination::all();
        return response()->json($destination, 200);
    }
    /////Destination ById
    public function show($id)
    {
        try {
            $destination = Destination::findOrfail($id);
            return response()->json($destination, 200);
        } catch (Exception) {
            return response()->json(['message' => 'Destination is not existed'], 404);
        }
    }
    //////Update
    public function update(UpdateDestinationRequest $request, $id)
{
    try {
        $destination = Destination::findOrFail($id);
        $validateData = $request->validated();


        foreach (['image1', 'image2', 'image3', 'image4'] as $field) {
            if ($request->hasFile($field)) {
                $path = $request->file($field)->store('Destination_photo', 'public');
                $validateData[$field] = $path;
            }
        }


        $destination->update($validateData);

        return response()->json([
            'message' => 'Destination updated successfully',
            'data'    => $destination
        ], 200);

    } catch (\Exception $e) {
        return response()->json(['message' => 'Destination not found'], 404);
    }
}

    ///Delete
    public function destroy($id)
    {
        try {
            $destination = Destination::findOrfail($id);


            $destination->delete();
            return response()->json(null, 204);
        } catch (Exception) {
            return response()->json(['message' => 'Destination is not existed'], 404);
        }
    }
    /////Destination By Type
    public function showDestinationByType($type)
    {
        $destination = Destination::getDestinationByType($type);

        if ($destination) {
            return response()->json($destination);
        }

        return response()->json(['message' => 'Destination not found'], 404);
    }



    //////////////////
    public function getDestinationsWithTouristGuide()
    {

        $destinations = Destination::whereHas('touristguide', function ($query) {
            $query->where('TouristGuide', 'Yes');
        })->get();


        return response()->json($destinations);
    }
    ////////////////DestinationByItsName
    public function ShowDetinationByName($destinationName)
    {
        $destination = Destination::getDestinationByName($destinationName);

        if ($destination) {
            return response()->json($destination);
        }

        return response()->json(['message' => 'Destination not found'], 404);
    }
    ////////////////DestinationByCountryName
    public function ShowDetinationByCountryName($country)
    {
        $c = Destination::getDestinationByCountryName($country);

        if ($c) {
            return response()->json($c);
        }

        return response()->json(['message' => 'Destination not found'], 404);
    }
    //////Destination to Tour
    public function getTourDestinations($tourId)
    {
        $bookings = Tour::findOrfail($tourId)->destinations;
        return response()->json($bookings, 200);
    }
}






///Update
    // public function update(UpdateDestinationRequest $request, $id)
    // {

    //     try {
    //         $destination = Destination::findOrfail($id);
    //         $validateData = $request->validated();
    //         if ($request->hasFile('image1')) {

    //             $path = $request->file('image1')->store('Destination photo', 'public');
    //             $validateData['image1'] = $path;
    //         }
    //         if ($request->hasFile('image2')) {
    //             $validateData['image2'] = $request->file('image2')->store('Destination photo', 'public');
    //         }
    //         if ($request->hasFile('image3')) {
    //             $validateData['image3'] = $request->file('image3')->store('Destination photo', 'public');
    //         }
    //         if ($request->hasFile('image4')) {
    //             $validateData['image4'] = $request->file('image4')->store('Destination photo', 'public');
    //         }
    //         $destination->update($validateData);

    //         return response()->json([
    //             'message' => 'Destination updated successfully',
    //             'data'    => $destination
    //         ], 201);
    //     } catch (Exception) {
    //         return response()->json(['message' => 'Destination is not existed'], 404);
    //     }
    // }
