<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCarRequest;
use App\Http\Requests\UpdateCarRequest;
use App\Models\Car;
use App\Models\User;
use App\Models\user_car;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CarController extends Controller
{
    //Store User

    public function store(StoreCarRequest $request)
    {

        $validateData = $request->validated();
        $car = Car::create($validateData);
        return response()->json(['message' => 'CarReequest Done', $car], 201);
    }
     public function getcarBookings($carId)
    {
        $bookings = Car::findOrfail($carId)->user;
        return response()->json($bookings, 200);
    }
    public function getBookingcars()
    {
        $user_id=Auth::user()->id;
        $hotels = User::findOrfail($user_id)->cars;
        return response()->json($hotels, 200);
    }

    public function update(UpdateCarRequest $request, $id)
    {
        try {
            $car = Car::findOrfail($id);

            $car->update($request->validated());
            return response()->json($car, 201);
        } catch (Exception) {
            return response()->json(['message' => 'car is not existed'], 404);
        }
    }
    public function destroy($id)
    {
        try {
            $car = Car::findOrfail($id);


            $car->delete();
            return response()->json(null, 204);
        } catch (Exception) {
            return response()->json(['message' => 'car is not existed'], 404);
        }
    }
    ///Confirm Admin

    public function confirm($carId)
    {
        try {
            $car = Car::findOrfail($carId);


            $car->update([
                'status' => 'confirmed'
            ]);

            return response()->json([
                'message' => 'Car Will be in the date, Welcome',
                'car' => $car
            ], 200);
        } catch (Exception) {
            return response()->json(['message' => 'There is no Car Booking Request matching'], 404);
        }
    }

    ////CarById
    public function show($id)
    {
        $car = Car::findOrfail($id);
        return response()->json($car, 200);
    }
    ///AllCars
    public function index()
    {
        $cars = Car::all();
        return response()->json($cars, 200);
    }
    public function addbookingsTocar(Request $request, $carId)
    {
        $user_id = Auth::user()->id;
        $car = Car::findOrfail($carId);
        $total_price_car=$car->car_Price*$request->numbers;

        $validateData=user_car::create([
        'user_id'=> $user_id,
        'car_id'=>$carId,
        'bookingStatus'=>$request->bookingStatus,
        'numbers'=>$request->numbers,
        'total_price_car'=>$total_price_car
    ]);


        return response()->json($validateData, 200);
    }
     public function search(Request $request)
    {
        // التحقق من المدخلات
        $request->validate([
            'status' => 'required|string',

        ]);

        // البحث عن الرحلات المطابقة
        $cars = Car::where('status', $request->status)
            ->get();

        // إرجاع النتيجة
        return response()->json($cars);
    }
}
