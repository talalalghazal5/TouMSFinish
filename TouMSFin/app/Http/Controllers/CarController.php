<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCarRequest;
use App\Models\Car;
use Exception;
use Illuminate\Http\Request;

class CarController extends Controller
{
    //Store User

    public function store(StoreCarRequest $request)
    {

        $validateData = $request->validated();
        $car = Car::create($validateData);
        return response()->json(['message' => 'CarReequest Done', $car], 201);
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
}
