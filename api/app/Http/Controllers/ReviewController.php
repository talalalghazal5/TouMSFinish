<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreReviewRequest;
use App\Models\Review;
use App\Models\Tour;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{ //GETReview By Id
    public function show($id)
    {
        try {
            $review = Review::findOrfail($id);
            return response()->json($review, 200);
        } catch (Exception) {
            return response()->json(['message' => 'Review is not existed'], 404);
        }
    }



    public function store(StoreReviewRequest $request, $tourName)
    {
        $validatedData = $request->validated();

        // الحصول على الرحلة بالاسم
        $tour = Tour::where('tourName', $tourName)->firstOrFail();

        // الحصول على المستخدم الحالي (من الـ token أو الـ session)
        $user = Auth::user();

        // إنشاء التقييم الجديد وربطه بالرحلة
        $review = new Review($validatedData);
        $review->save();

        // ربط التقييم بالرحلة (جدول tour_review)
        $tour->reviews()->attach($review->id);

        // ربط التقييم بالمستخدم (جدول review_user)
        $user->reviews()->attach($review->id);

        return response()->json([
            'message' => 'Review sent successfully.',
            'review'  => $review,
            'user'    => [
                'id'    => $user->id,
                'name'  => $user->name,
                'email' => $user->email,
            ]
        ], 201);
    }
    ////Review By TourName
    public function showByName($tourName)
    {
        $c = Tour::getTourName($tourName);
        $s = $c->review;

        if ($c) {
            return response()->json($s);
        }

        return response()->json(['message' => ' Not found'], 404);
    }




    //////////////////
    public function getReviewsByTourName($tourName)
    {
        $tour = Tour::where('tourName', $tourName)
            ->with(['reviews.users']) // تحميل التقييمات مع المستخدمين
            ->first();

        if (!$tour) {
            return response()->json([
                'message' => 'Tour not found'
            ], 404);
        }

        return response()->json([
            'tour' => $tour->tourName,
            'reviews' => $tour->reviews->map(function ($review) {
                return [
                    'reviewDate' => $review->reviewDate,
                    'raiting'    => $review->raiting,
                    'comment'    => $review->comment,
                    'users'      => $review->users->map(function ($user) {
                        return [
                            'id'    => $user->id,
                            'name'  => $user->name,
                            'email' => $user->email,
                            'role'  => $user->role,
                        ];
                    })
                ];
            })
        ], 200);
    }
}



























 // public function store(StoreReviewRequest $request, $tourName)
    // {

    //     $validateData = $request->validated();

    //     $tour = Tour::where('tourName', $tourName)->firstOrFail();


    //     if ($tour->review) {
    //         $tour->review->update($validateData);
    //         $review = $tour->review;
    //     } else {

    //         $review = $tour->reviews()->create($validateData);
    //     }

    //     return response()->json([
    //         'message' => 'Review sent to admin successfully.',
    //         'review'  => $review,
    //     ], 201);
    // }



     ////
    // public function getReviewsByTourName($tourName)
    // {
    //     $tour = Tour::where('tourName', $tourName)->with('reviews')->first();

    //     if (!$tour) {
    //         return response()->json([
    //             'message' => 'Tour not found'
    //         ], 404);
    //     }

    //     return response()->json([
    //         'tour' => $tour->tourName,
    //         'reviews' => $tour->reviews->map(function ($review) {
    //             return [
    //                 'reviewDate' => $review->reviewDate,
    //                 'raiting' => $review->raiting,
    //                 'comment'   => $review->comment,
    //             ];
    //         })
    //     ], 200);
    // }
