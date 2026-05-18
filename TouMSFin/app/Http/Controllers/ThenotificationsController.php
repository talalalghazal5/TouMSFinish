<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreNotificationRequest;
use App\Models\Thenotifications;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ThenotificationsController extends Controller
{
    public function show($id)
    {
        $$notification = Thenotifications::findOrfail($id);
        return response()->json($$notification, 200);
    }
    public function createNotification(StoreNotificationRequest $request)
    {


        $validateData = $request->validated();
        //$validateData['user_id']=$user_id;
        $notifiction = Thenotifications::create($validateData);


        return response()->json($notifiction, 201);
    }



    public function getNotificationUsers($notificationId)
    {

        $users = Thenotifications::findOrfail($notificationId)->users;
        return response()->json($users, 200);
    }

    public function getUserNotifications($userId)
    {

        $notifications = Thenotifications::findOrfail($userId)->notifications;
        return response()->json($notifications, 200);
    }
    ///Payment Notification
    public function addPaymentNotificationsToUser(Request $request, $userId)
    {
        $user = User::findOrfail($userId);
        $user->notifications()->attach($request->notification_id);
        return response()->json('Notification add successfuly', 200);
    }


    public function addAdminNotificationsToAllUsers()
    {
        $internalNotifications = Thenotifications::where('notificationType', 'Internal')->get();

        $users = User::all();

        foreach ($users as $user) {
            foreach ($internalNotifications as $not) {
                $user->notifications()->attach($not->id);
            }
        }
        return response()->json(['message' => 'done']);
    }
}
