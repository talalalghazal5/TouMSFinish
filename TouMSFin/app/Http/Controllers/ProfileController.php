<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProfileRequest;
use App\Http\Requests\UpdateProfileRequest;
use App\Models\Profile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{

    ////Store
    public function store(StoreProfileRequest $request)
    {
        $userId = Auth::user()->id;
        $validated = $request->validated();
        $validated['user_id'] = $userId;
        if ($request->hasFile('image')) {

            $path = $request->file('image')->store('my photo', 'public');
            $validated['image'] = $path;
        }
        $profile = Profile::create($validated);
        return response()->json([
            'message:' => 'profile created successfully.',
            'profile:' => $profile,
        ], 201);
    }
    public function show()
    {

        $user = Auth::user()->load('profile');

        return response()->json([
            'user' => $user
        ]);
    }

    ///Update

    public function update(Request $request)
    {
        $user = Auth::user();


        $validated = $request->validate([
            'name' => 'sometimes|string|max:100',
            'email' => 'sometimes|email|unique:users,email,' . $user->id,
            'phone' => 'sometimes|string|max:15',
            'address' => 'sometimes|nullable|string|max:100',
            'date-of-birth' => 'sometimes|nullable|date',
            'image' => 'sometimes|image|mimes:png,jpg,jpeg,gif|max:2048',
        ]);

        // تحديث بيانات المستخدم الأساسية
        $user->update([
            'name' => $validated['name'] ?? $user->name,
            'email' => $validated['email'] ?? $user->email,
        ]);

        // تحديث بيانات البروفايل
        $profileData = [
            'phone' => $validated['phone'] ?? $user->profile->phone,
            'address' => $validated['address'] ?? $user->profile->address,
            'date-of-birth' => $validated['date-of-birth'] ?? $user->profile->date_of_birth,
        ];

        // رفع صورة جديدة إذا موجودة
        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('my photo', 'public');
            $profileData['image'] = $path;
        }

        $user->profile()->update($profileData);

        return response()->json([
            'message' => 'Profile updated successfully',
            'user' => $user->load('profile'),
        ]);
    }



    // public function update(UpdateProfileRequest $request, $id)
    // {
    //     $profile = Profile::where('user_id', $id)->firstOrfail();
    //     $profile->update($request->validated());
    //     return response()->json([$id => 'is  valid', 'profile' => $profile], 201);
    // }
}
