<?php

namespace App\Http\Controllers;

use App\Models\Tour;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:90',
            'email' => 'required|string|email|max:255|unique:users,email',
            'password' => 'required|string|min:8|confirmed',
            'role' => 'required|in:admin,user,touristguide',

        ]);
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role,

        ]);

        return response()->json([
            'message:' => 'User registered successfully',
            'User' => $user
        ], 200);
    }
    public function login(Request $request)
    {
        $request->validate([

            'email' => 'required|string|email',
            'password' => 'required|string'
        ]);
        if (!Auth::attempt($request->only('email', 'password')))
            return response()->json([
                'message:' => 'invalid email or password',

            ], 401);
        $user = User::where('email', $request->email)->FirstOrFail();


        $token = $user->createToken('auth_Token')->plainTextToken;

        return response()->json([
            'message:' => 'Login Successfully',
            'User:' => $user,
            "Token:" => $token
        ], 201);
    }
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message:' => 'Logout Successfully']);
    }






    public function getProfile()
    {
        $user_id = Auth::user()->id;
        $profile =  User::find($user_id)->profile;
        return response()->json($profile, 200);
    }


    public function getUserTours($id)
    {
        $tours = User::find($id)->tours;
        return response()->json($tours, 200);
    }
    //////
    public function getMyTours()
    {
        $user_id = Auth::user()->id;
        $tours = User::find($user_id)->tours;
        return response()->json($tours, 200);
    }
    ///////
    public function addToursToUser(Request $request)
    {
        $user_id = Auth::user()->id;
        $user = User::findOrfail($user_id);
        $user->tours()->attach($request->tour_id);
        return response()->json('Tour add successfuly', 200);
    }
    public function addToursToAllUser()
    {
        $alltours = Tour::all();

        $users = User::all();

        foreach ($users as $user) {
            foreach ($alltours as $tour) {
                $user->tours()->attach($tour->id);
            }
        }
        return response()->json(['message' => 'done']);
    }
}
