<?php

namespace App\Http\Controllers;

use App\Http\Requests\StorePaymentRequest;
use App\Models\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    //
    public function show($id){

        $payment=Payment::where('user_id',$id)->firstOrfail();
        return response()->json(['the required payment:'=>$payment], 200);
    }
    public function store(StorePaymentRequest $request)
    {
     $payment=Payment::create($request->validated());
     return response()->json([
        'message:'=>'paaymeny done successfully.',
        'payment:'=>$payment,]);
    }

}
