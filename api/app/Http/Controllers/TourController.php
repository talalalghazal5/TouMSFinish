<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreTourRequest;
use App\Http\Requests\UpdateTourRequest;
use App\Models\Booking;
use App\Models\Destination;
use App\Models\Offer;
use App\Models\Tour;
use App\Models\User;
use App\Models\user_tour;
use App\Notifications\OfferNotification;
use App\Notifications\TourNotification;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;

class TourController extends Controller
{

    public function store(StoreTourRequest $request)
    {

        $validateData = $request->validated();
        if ($request->hasFile('image')) {

            $path = $request->file('image')->store('Tour_photo', 'public');
            $validateData['image'] = $path;
        }
        $tour = Tour::create($validateData);
         $users=User::all();
        Notification::send($users,new TourNotification($tour));

        return response()->json([
                'message' => 'Tour Added successfully',
                'data'    => $tour
            ], 201);
    }
    //AllTour
    public function index()
    {
        $tour = Tour::all();
        return response()->json($tour, 200);
    }
    ///TourById
    public function show($id)
    {
        try {
            $tour = Tour::findOrfail($id);
            return response()->json($tour, 200);
        } catch (Exception) {
            return response()->json(['message' => 'Tour is not existed'], 404);
        }
    }
    //Update
    public function update(UpdateTourRequest $request, $id)
    {
        try {
            $validateData = $request->validated();
            $tour = Tour::findOrfail($id);
            if ($request->hasFile('image')) {

                $path = $request->file('image')->store('Tour_photo', 'public');
                $validateData['image'] = $path;
            }


            $tour->update($validateData);
            return response()->json([
                'message' => 'Tour updated successfully',
                'data'    => $tour
            ], 201);
        } catch (Exception) {
            return response()->json(['message' => 'Tour is not existed'], 404);
        }
    }

    ///Delete
    public function destroy($id)
    {
        try {
            $tour = Tour::findOrfail($id);


            $tour->delete();
            return response()->json(null, 204);
        } catch (Exception) {
            return response()->json(['message' => 'Tour is not existed'], 404);
        }
    }
    //Offer
    public function addOffersToTour(Request $request, $tourId)
    {
        $tour = Tour::findOrfail($tourId);
        $tour->offers()->attach($request->offer_id);
        $offer = Offer::findOrfail($request->offer_id);
        $users=User::all();
        Notification::send($users,new OfferNotification($offer));
        return response()->json('Offer add successfuly', 200);
    }
    public function getOfferToursWithId($offerId)
    {
        $tours = Offer::findOrfail($offerId)->tours;
        return response()->json($tours, 200);
    }



    public function getTourUsers($tourId)
    {
        $users = Tour::findOrfail($tourId)->users;
        return response()->json($users, 200);
    }


    //Booking

    // public function getBookingTours($bookingId)
    // {
    //     $tours = Booking::findOrfail($bookingId)->tours;
    //     return response()->json($tours, 200);
    // }

    // public function addbookingsToTour(Request $request, $tourId)
    // {
    //     $tour = Tour::findOrfail($tourId);
    //     $tour->bookings()->attach($request->booking_id);
    //     return response()->json('Booking done ,go to reserve a Filght Ticket', 200);
    // }


    public function getTourBookings($tourId)
    {
        $bookings = Tour::findOrfail($tourId)->bookings;
        return response()->json($bookings, 200);
    }
    public function getAllTours()
    {
        $tours = Tour::all();
        return response()->json($tours, 200);
    }

    //Favourite Tours
    public function addToFavorites($tourId)
    {
        Tour::FindOrFail($tourId);
        Auth::user()->favoriteTours()->syncWithoutDetaching($tourId);

        return response()->json(['message:' => 'added Succssfully'], 200);
    }
    public function removeFromFavorite($tourId)
    {
        Tour::FindOrFail($tourId);
        Auth::user()->favoriteTours()->detach($tourId);
        return response()->json(['message:' => 'removed Succssfully'], 200);
    }
    public function getFavoriteTours()
    {


        $favoriteTours =  Auth::user()->favoriteTours()->get();
        return response()->json($favoriteTours);
    }
    ////////////////
    public function index1()
    {
        // ا
        $toursWithOffers = Tour::toursWithOffers();


        return response()->json($toursWithOffers);
    }
    public function addDestinationToTour(Request $request, $tourId)
    {
        $tour = Tour::findOrfail($tourId);
        $tour->destinations()->attach($request->destination_id);
        return response()->json('Destination is added succesfully', 200);
    }
    /////DEstination Tours
    public function getDestinationTours($destinationID)
    {
        $tours = Destination::findOrfail($destinationID)->tours;
        return response()->json($tours, 200);
    }
    ///////Tours Destination to User

    public function getDestinationsByTourName($tourName)
    {
        $tour = Tour::with('destinations')
            ->where('tourName', $tourName)
            ->firstOrFail();

        return response()->json([
            'tour' => $tour->tourName,
            'destinations' => $tour->destinations
        ]);
    }

  public function addbookingsToTour(Request $request, $tourId)
    {
           $user_id = Auth::user()->id;
        $tour = Tour::findOrfail($tourId);
       $total_price_tour=$tour->tourPrice*$request->numbers;

         $validateData= user_tour::create([
         'user_id'=> $user_id,
         'tour_id'=>$tourId,
         'numbers'=>$request->numbers,
        'total_price_tour'=>$total_price_tour
    ]);
    return response()->json($validateData, 200);
    }


}
