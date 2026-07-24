<?php

namespace App\Http\Controllers;

use App\Http\Requests\StorePaymentRequest;
use App\Models\Payment;
use App\Models\user_car;
use App\Models\user_flight;
use App\Models\user_hotel;
use App\Models\user_tour;
use App\Models\Wallet;
use App\Notifications\PayNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;

class PaymentController extends Controller
{
    //
    // public function show($id){

    //     $payment=Payment::where('user_id',$id)->firstOrfail();
    //     return response()->json(['the required payment:'=>$payment], 200);
    // }
    // public function store(StorePaymentRequest $request)
    // {
    //  $payment=Payment::create($request->validated());
    //  return response()->json([
    //     'message:'=>'paaymeny done successfully.',
    //     'payment:'=>$payment,]);
    // }
    public function plus($user_id){
      //  $user_id=Auth::user()->id;
        $flights = user_flight::where('user_id', $user_id)->get();
        $total_price_flight = 0;

        for ($i = 0; $i < count($flights); $i++) {
        $total_price_flight += $flights[$i]->total_price_flight;
    }
     $hotels = user_hotel::where('user_id', $user_id)->get();
        $total_price_hotel = 0;

        for ($i = 0; $i < count($hotels); $i++) {
        $total_price_hotel += $hotels[$i]->total_price_hotel;
    }
     $tours = user_tour::where('user_id', $user_id)->get();
        $total_price_tour = 0;
        for ($i = 0; $i < count($tours); $i++) {
        $total_price_tour += $tours[$i]->total_price_tour;
    }
    $total_price=$total_price_flight+$total_price_hotel+$total_price_tour;
    // $paymants=Payment::create([
    //     'user_id'=>$user_id,
    //     'total_price_fligth'=>$total_price_flight,
    //     'total_price_hotel'=>$total_price_hotel,
    //     'total_price_tour'=>$total_price_tour,
    //     'total_price'=>$total_price]);

return response()->json();
}
 public function pay()
    {
        $user_id= Auth::user()->id;
        $wallet=Wallet::findOrFail($user_id);
        //$pay=Payment::findOrFail($user_id);
       $pay = Payment::where('user_id', $user_id)->get();
      $this->plus($user_id);
        $total_price = 0;

        for ($i = 0; $i < count($pay); $i++) {
        $total_price += $pay[$i]->total_price;
    }
         try {
         $wallet->pay($total_price);
        // $userss=User::;
      //  Notification::send($user_id,new PayNotification($total_price));
           return response()->json([$pay,'balance' => $wallet->balance], 200);

        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }
     public function destroy($id)
    {
        try {
            $pay = Payment::findOrfail($id);


            $pay->delete();
            return response()->json(null, 204);
        } catch (Exception) {
            return response()->json(['message' => ' is not existed'], 404);
        }
    }



}
