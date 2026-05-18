<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreFlightRequest;
use App\Http\Requests\UpdateFlightRequest;
use App\Models\Booking;
use App\Models\Flight;
use Exception;
use Illuminate\Http\Request;

class FlightController extends Controller
{

    public function store(StoreFlightRequest $request)
    {

        $validateData = $request->validated();
        // if ($request->hasFile('image')) {

        //     $path = $request->file('image')->store('Flight photo', 'public');
        //     $validateData['image'] = $path;
        // }
        $flight = Flight::create($validateData);


        return response()->json([
            'message' => 'Flght added successfully',
            'data'    => $flight
        ], 201);
    }
    ///AllFlight
    public function index()
    {
        $flights = Flight::all();
        return response()->json($flights, 200);
    }
    /////getFlightByID

    public function show($id)
    {
        try {

            $flight = Flight::findOrfail($id);
            return response()->json($flight, 200);
        } catch (Exception) {
            return response()->json(['message' => 'Flight is not existed'], 404);
        }
    }


    ///Update
    public function update(UpdateFlightRequest $request, $id)
    {
        $validateData = $request->validated();
        try {
            $flight = Flight::findOrfail($id);
            // if ($request->hasFile('image')) {

            //     $path = $request->file('image')->store('Flight photo', 'public');
            //     $validateData['image'] = $path;
            // }
            $flight->update($validateData);
            return response()->json([
                'message' => 'Flight updated successfully',
                'data'    => $flight
            ], 201);
        } catch (Exception) {
            return response()->json(['message' => 'Flight is not existed'], 404);
        }
    }

    ///Delete
    public function destroy($id)
    {
        try {
            $flight = Flight::findOrfail($id);


            $flight->delete();
            return response()->json(null, 204);
        } catch (Exception) {
            return response()->json(['message' => 'Flight is not existed'], 404);
        }
    }

    ///Confirm Admin

    public function confirm($flightId)
    {
        try {
            $flight = Flight::findOrfail($flightId);


            $flight->update([
                'status' => 'confirmed'
            ]);

            return response()->json([
                'message' => 'Your Flight has been booked',
                'flight' => $flight
            ], 200);
        } catch (Exception) {
            return response()->json(['message' => 'There is no Flight Booking Request matching'], 404);
        }
    }
    //Booking

    public function getBookingFlights($bookingId)
    {
        $flights = Booking::findOrfail($bookingId)->flights;
        return response()->json($flights, 200);
    }

    public function addBookingstoFlight(Request $request, $flightId)
    {
        $flight = Flight::findOrfail($flightId);
        $flight->bookings()->attach($request->booking_id);
        return response()->json('Booking done ,go to reserve Hotel if you want this', 200);
    }
    ///////
    public function search(Request $request)
    {
        // التحقق من المدخلات
        $request->validate([
            'From' => 'required|string',
            'To' => 'required|string',
            'departureDate' => 'required|date',
        ]);

        // البحث عن الرحلات المطابقة
        $flights = Flight::where('From', $request->From)
            ->where('To', $request->To)
            ->whereDate('departureDate', $request->departureDate)
            ->get();

        // إرجاع النتيجة
        return response()->json($flights);
    }
}
