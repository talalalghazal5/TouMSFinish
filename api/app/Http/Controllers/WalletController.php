<?php

namespace App\Http\Controllers;

use App\Models\Wallet;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use PhpParser\Node\Stmt\Catch_;
use PhpParser\Node\Stmt\TryCatch;

class WalletController extends Controller
{
     public function create( Request $request,$user_id)
    {
        //$user = Auth::user();

       if (!$user_id->wallet()->existes()) {
            $wallet = Wallet::create([
                'user_id' => $user_id,
                'balance' => $request->balance,
            ]);
       }

        return response()->json(['wallet' => $user_id->wallet], 201);
    }

    //  public function update(Request $request)
    // {
    //     $user_id = Auth::user()->id;
    //     $wallet=Wallet::findOrFail($user_id)
    //    //if (!$user->wallet) {
    //         $wallet->update([
    //             'user_id' => $user_id->id,
    //             'balance' => $request->balance,
    //         ]);
    //    //}

    //     return response()->json(['wallet' => $user_id->wallet], 201);
    // }
    public function deposit(Request $request)
{
    try{
    $request->validate([
        'amount' => 'required|numeric|min:1',
    ]);


    $wallet = Wallet::findOrFail($request->user_id);

    if (! $wallet) {
        return response()->json([
            'message' => 'Wallet not found'
        ], 404);
    }

    $wallet->balance += $request->amount;
    $wallet->save();
    } catch (Exception $e) {
            return response()->json(['error'=> $e->getMessage()],400);
        }

    return response()->json([
        'message' => 'Deposit successful',
        'balance' => $wallet->balance
    ]);
}
public function withdraw(Request $request)
{
    try{

    $request->validate([
        'amount' => 'required|numeric|min:1',
    ]);


    $wallet = Wallet::findOrFail($request->user_id);

    if (! $wallet) {
        return response()->json([
            'message' => 'Wallet not found'
        ], 404);
    }

    // التحقق من الرصيد
    if ($wallet->balance < $request->amount) {
        return response()->json([
            'message' => 'Insufficient balance'
        ], 400);
    }

    $wallet->balance -= $request->amount;
    $wallet->save();
    } catch (Exception $e) {
            return response()->json(['error'=> $e->getMessage()],400);
        }

    return response()->json([
        'message' => 'Withdrawal successful',
        'balance' => $wallet->balance
    ]);
}
}
