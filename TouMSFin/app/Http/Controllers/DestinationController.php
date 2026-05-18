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
use Illuminate\Support\Facades\Auth;

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
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    public function requestGuide(Request $request)
    {
        try {
            $request->validate([
                'needs_guide' => 'required|in:Yes,No',
                'destination_id' => 'required_if:needs_guide,Yes|exists:destinations,id',
                'date' => 'required_if:needs_guide,Yes|date',
            ]);



            if ($request->needs_guide === 'Yes') {
                $user = $request->user();
                $user->destinations()->attach(
                    $request->destination_id,
                    [
                        'date' => $request->date,
                        'status' => 'pending'
                    ]
                );

                return response()->json([
                    'success' => true,
                    'message' => 'تم إرسال طلب مرشد سياحي إلى الأدمن.',
                ]);
            }

            return response()->json([
                'success' => true,
                'message' => 'لم يتم طلب مرشد سياحي.',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////
    public function sendRequestToGuide($destinationId, $userId, $guideId)
    {
        $admin = Auth::user();


        $destination = Destination::findOrFail($destinationId);

        $destination->users()->updateExistingPivot($userId, [
            'status' => 'sent_to_guide',
            'guide_id' => $guideId,
        ]);

        $user = User::findOrFail($userId);
        $guide = User::findOrFail($guideId);

        return response()->json([
            'message' => 'Request sent to guide successfully.',
            'guide' => $guide->name,
            'user' => $user->name,
            'destination' => $destination->destinationName,
            'date' => $destination->users()->find($userId)->pivot->requested_date,
        ]);
    }
    //////////////////////////////////////////////////////////////////////////////////////////////
    public function confirmGuideRequest($destinationId, $userId)
    {
        $guide = Auth::user();


        $destination = Destination::findOrFail($destinationId);

        $destination->users()->updateExistingPivot($userId, [
            'status' => 'confirmed_by_guide',
        ]);

        return response()->json([
            'message' => 'Guide confirmed the request.',
            'destination' => $destination->destinationName,
            'user_id' => $userId,
            'guide' => $guide->name,
        ]);
    }
    ////////////////////////////////////////////////////////////////
    public function approveRequestByAdmin($destinationId, $userId)
    {
        $admin = Auth::user();


        $destination = Destination::findOrFail($destinationId);

        $destination->users()->updateExistingPivot($userId, [
            'status' => 'accepted_by_admin',
        ]);

        return response()->json([
            'message' => 'Admin approved the request and informed the user.',
            'destination' => $destination->destinationName,
            'user' => User::findOrFail($userId)->name,
            'status' => 'accepted_by_admin'
        ]);
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
