<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreHotelRequest;
use App\Http\Requests\UpdateHotelRequest;
use App\Models\Booking;
use App\Models\Hotel;
use App\Models\User;
use App\Models\user_hotel;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HotelController extends Controller
{ ///Store
    public function store(StoreHotelRequest $request)
    {

        $validateData = $request->validated();

        if ($request->hasFile('image1')) {

            $path = $request->file('image1')->store('Hotel_photo', 'public');
            $validateData['image1'] = $path;
        }
        if ($request->hasFile('image2')) {
            $validateData['image2'] = $request->file('image2')->store('Hotel_photo', 'public');
        }
        if ($request->hasFile('image3')) {
            $validateData['image3'] = $request->file('image3')->store('Hotel_photo', 'public');
        }
        if ($request->hasFile('image4')) {
            $validateData['image4'] = $request->file('image4')->store('HotelpHotel_photohoto', 'public');
        }
        $hotel = Hotel::create($validateData);


        return response()->json([
            'message' => 'Hotel added successfully',
            'data'    => $hotel
        ], 201);
    }

    ////All Hotels
    public function index()
    {
        $hotels = Hotel::all();
        return response()->json($hotels, 200);
    }
    ///Confirm Admin

    public function confirm($hoteId)
    {
        try {
            $hotel = Hotel::findOrfail($hoteId);

            $hotel->update([
                'status' => 'confirmed'
            ]);

            return response()->json([
                'message' => 'Your Hotel has been booked',
                'Hotel' => $hotel
            ], 200);
        } catch (Exception) {
            return response()->json(['message' => 'There is no Hotel Booking Request matching'], 404);
        }
    }
    //////////////
    public function ShowHotelById($id)
    {
        $hotel = Hotel::findOrfail($id);
        return response()->json($hotel, 200);
    }
    ///Update
    public function update(UpdateHotelRequest $request, $id)
    {
        try {
            $validateData = $request->validated();
            $hotel = Hotel::findOrfail($id);
            foreach (['image1', 'image2', 'image3', 'image4'] as $field) {
            if ($request->hasFile($field)) {
                $path = $request->file($field)->store('Hotel_photo', 'public');
                $validateData[$field] = $path;
            }
            $hotel->update($validateData);
            return response()->json([
                'message' => 'Hotel updated successfully',
                'data'    => $hotel
            ], 201);
        }} catch (Exception) {
            return response()->json(['message' => 'Hotel is not existed'], 404);
        }
    }

    ///Delete
    public function destroy($id)
    {
        try {
            $hotel = Hotel::findOrfail($id);


            $hotel->delete();
            return response()->json(null, 204);
        } catch (Exception) {
            return response()->json(['message' => 'Hotel is not existed'], 404);
        }
    }

    //Booking

    public function getHotelBookings($hotelId)
    {
        $bookings = Hotel::findOrfail($hotelId)->user;
        return response()->json($bookings, 200);
    }
    public function getBookingHotels()
    {
        $user_id=Auth::user()->id;
        $hotels = User::findOrfail($user_id)->hotels;
        return response()->json($hotels, 200);
    }
    // public function addbookingsToHotel(Request $request, $hotelId)
    // {
    //     $hotel = Hotel::findOrfail($hotelId);
    //     $hotel->bookings()->attach($request->booking_id);
    //     return response()->json('Booking done ,waiting for payment', 200);
    // }
    public function showHotelByCityName($cityName)
    {
        $hotel = Hotel::getHotelByCityName($cityName);

        if ($hotel) {
            return response()->json($hotel);
        }

        return response()->json(['message' => ' Not found'], 404);
    }

    public function ShowMostFamiliarHotels()
    {
        $fiveStarHotels = Hotel::fiveStars()->get();
        return  response()->json($fiveStarHotels, 200);
    }
    public function addbookingsToHotel(Request $request, $hotelId)
    {
      $user_id = Auth::user()->id;
        $hotel = Hotel::findOrfail($hotelId);
         $hotel->bookingRooms($request->numberOfRooms);
         $hotelDaysPrice=$hotel->hotelDayPrice*$request->numberOfDays;
       $total_price_hotel=$hotelDaysPrice*$request->numberOfRooms;

      $validateData=user_hotel::create([
         'user_id'=> $user_id,
         'hotel_id'=>$hotelId,
         'bookingStatus'=>$request->bookingStatus,
         'numberOfDays'=>$request->numberOfDays,
         'numberOfRooms'=>$request->numberOfRooms,
        'total_price_hotel'=>$total_price_hotel
    ]);


        return response()->json($validateData, 200);
    }
}
