<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreOfferRequest;
use App\Http\Requests\UpdateOfferRequest;
use App\Models\Offer;
use App\Models\Tour;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;

class OfferController extends Controller
{
//    public function getOfferUsers($offerId){

//         $users=Offer::findOrfail($offerId)->users;
//         return response()->json($users, 200);
//     }

//      public function getUserOffers($userId){

//         $offers=User::findOrfail($userId)->offers;
//         return response()->json($offers, 200);
//     }

    // public function addOffersToUser(Request $request,$userId){
    // $user=User::findOrfail($userId);
    // $user->offres()->attach($request->offer_id);
    // return response()->json('Offer add successfuly',200);
    // }
////////////////////////////////////////
   ///Store
    public function store(StoreOfferRequest $request)
    {

        $validateData = $request->validated();
        $offer = Offer::create($validateData);


        return response()->json($offer, 201);
    }
    ////AllDestination
    public function index()
    {
        $offer = Offer::all();
        return response()->json($offer, 200);
    }
    /////Destination ById
    public function show($id)
    {
        try {
            $offer = Offer::findOrfail($id);
            return response()->json($offer, 200);
        } catch (Exception) {
            return response()->json(['message' => 'Offer is not existed'], 404);
        }
    }
    ///Update
    public function update(UpdateOfferRequest $request, $id)
    {
        try {
            $offer = Offer::findOrfail($id);

            $offer->update($request->validated());
            return response()->json($offer, 201);
        } catch (Exception) {
            return response()->json(['message' => 'Offer is not existed'], 404);
        }
    }

    ///Delete
    public function destroy($id)
    {
        try {
            $destination = Offer::findOrfail($id);


            $destination->delete();
            return response()->json(null, 204);
        } catch (Exception) {
            return response()->json(['message' => 'Destination is not existed'], 404);
        }
    }


    ///////
    public function getTourOffers($tourId)
    {
        $offers = Tour::findOrfail($tourId)->offers;
        return response()->json($offers, 200);
    }

}

