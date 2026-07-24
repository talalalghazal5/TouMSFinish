<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreBookingRequest;
use App\Models\Booking;
use App\Models\Flight;
use App\Models\Hotel;
use App\Models\Tour;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BookingController extends Controller
{
    public function getAllBookings()
    {
        $bookings = Auth::user()->bookings;

        return response()->json($bookings, 200);
    }

    public function show($id)
    {
        $booking = Booking::findOrfail($id);
        return response()->json($booking, 200);
    }
    public function store(StoreBookingRequest $request)
    {
        $user_id = Auth::user()->id;
        $validateData = $request->validated();
        $validateData['user_id'] = $user_id;
        $booking = Booking::create($validateData);


        return response()->json($booking, 201);
    }
    //TourBookings
    public function getTourBookings($tourId)
    {
        $bookings = Tour::findOrfail($tourId)->bookings;
        return response()->json($bookings, 200);
    }
    //FlightBookings
    public function getFlightBookings($flightId)
    {
        $bookings = Flight::findOrfail($flightId)->bookings;
        return response()->json($bookings, 200);
    }

    //HotelBookings
    public function getHotelBookings($hotelId)
    {
        $bookings = Hotel::findOrfail($hotelId)->bookings;
        return response()->json($bookings, 200);
    }
}
