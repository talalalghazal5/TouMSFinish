<?php

namespace App\Http\Controllers;

use App\Http\Requests\SupportRequest;
use App\Models\Support;
use App\Models\User;
use Illuminate\Http\Request;

class SupportController extends Controller
{
      public function show($id)
    {
        $support = Support::findOrfail($id);
        return response()->json($$support, 200);
    }
    public function createsuportresponse(SupportRequest $request)
    {
        // if (Auth::user()->role !== 'admin') {
        //     return response()->json(['error,juat admin can insert notifications']);
        // }

        $validateData = $request->validated();
        //$validateData['user_id']=$user_id;
        $notifiction = Support::create($validateData);


        return response()->json($notifiction, 201);
    }



    public function getNotificationUsers($supportId)
    {

        $users = Support::findOrfail($supportId)->users;
        return response()->json($users, 200);
    }

    public function getUserNotifications($userId)
    {

        $supports = Support::findOrfail($userId)->supports;
        return response()->json($supports, 200);
    }
    ///Payment Notification
    public function addSpecialSupportToUser(Request $request, $userId)
    {
        $user = User::findOrfail($userId);
        $user->supports()->attach($request->support_id);
        return response()->json('Notification add successfuly', 200);
    }
    ////////////////////
    public function assignFaqToUsers(){
        $faqSupports = Support::where('requestType', 'FAQ')->get();


        $users = User::all();

        foreach ($users as $user) {
            foreach ($faqSupports as $faq) {
                $user->supports()->attach($faq->id);
            }
        }

        return response()->json(['message' => 'done']);
    }

}
