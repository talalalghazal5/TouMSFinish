<?php

use App\Http\Controllers\BookingController;
use App\Http\Controllers\CarController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DestinationController;
use App\Http\Controllers\FlightController;
use App\Http\Controllers\HotelController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\OfferController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\SupportController;
use App\Http\Controllers\TourController;
use App\Http\Controllers\TouristguideController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WalletController;
use App\Http\Middleware\CheckUserRole;
use App\Models\Payment;
use App\Models\Thenotifications;
use App\Models\Tour;
use Database\Seeders\DestinationSeeder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
//Reg,Log

Route::post('register', [UserController::class, 'register']);
Route::post('login', [UserController::class, 'login']);
Route::post('logout', [UserController::class, 'logout'])->middleware('auth:sanctum');


Route::middleware('auth:sanctum')->group(function () {
    //Store
    Route::post('bookings', [BookingController::class, 'store']); //user
    Route::post('plus', [PaymentController::class, 'plus']);
    Route::post('pay', [PaymentController::class, 'pay']);  //user
    Route::post('cars', [CarController::class, 'store']); //user
    //Review
    Route::post('reviews/{tourName}', [ReviewController::class, 'store']); //USER
    Route::get('showAdreviews/{id}', [ReviewController::class, 'show'])->middleware('CheckUserRole'); //ADMIN
    Route::get('showreviews/{tourName}', [ReviewController::class, 'getReviewsByTourName']);

    //Profile
    Route::post('profile', [ProfileController::class, 'store'])->middleware('auth:sanctum');

    Route::get('getProfile', [ProfileController::class, 'show'])->middleware('auth:sanctum'); //user
    Route::post('updateprofile', [ProfileController::class, 'update'])->middleware('auth:sanctum');

    //UserTour
    Route::get('usertours', [UserController::class, 'getUserTours']);
    Route::get('tours/{tourid}/users', [TourController::class, 'getTourUsers']); //user
    Route::post('userstours', [UserController::class, 'addToursToUser']); //user
    Route::post('tourstoallUser', [UserController::class, 'addToursToAllUser'])->middleware('CheckUserRole');
    Route::get('user/tours', [UserController::class, 'getMyTours']); //user


    //DestinationTour
    Route::get('destination/{destinationid}/tours', [TourController::class, 'getDestinationTours']); ///ADMIN
    Route::get('tours/{tourid}/destinations', [DestinationController::class, 'getTourDestinations'])->middleware('CheckUserRole'); //ADMIN
    Route::post('tours/{tourId}/destinations', [TourController::class, 'addDestinationToTour'])->middleware('CheckUserRole'); //ADMIN
    ///Destination

    Route::get('destinations/{type}', [DestinationController::class, 'showDestinationByType']);
    Route::get('/destinations/{name}/Name', [DestinationController::class, 'ShowDetinationByName']);
    Route::get('/destinations/{name}/country', [DestinationController::class, 'ShowDetinationByCountryName']);
    Route::get('/toursDestinations/{tourName}', [TourController::class, 'getDestinationsByTourName']);
    //OfferTour
    Route::post('tours/{tourId}/offers', [TourController::class, 'addOffersToTour'])->middleware('CheckUserRole'); //admin
    Route::get('tours/{tourId}/offers', [OfferController::class, 'getTourOffers']); //user
    Route::get('offer/{offerId}/tours', [TourController::class, 'getOfferToursWithId']); //user
    Route::get('offer/tours', [TourController::class, 'index1']);
    Route::get('tours/all', [TourController::class, 'getAllTours']);

    //Notification

    //Support
    Route::post('supports', [SupportController::class, 'createsuportresponse'])->middleware('CheckUserRole');
    Route::post('users/{userId}/supports', [SupportController::class, 'addSpecialSupportToUser'])->middleware('CheckUserRole');;
    Route::get('supports/{supportid}/users', [SupportController::class, 'getSupportUsers'])->middleware('CheckUserRole');
    Route::get('users/{userId}/supports', [SupportController::class, 'getUserSupports']);
    Route::post('sup', [SupportController::class, 'assignFaqToUsers'])->middleware('CheckUserRole');

    //BookingFlight
    Route::get('booking/flights', [FlightController::class, 'getBookingFlights']); //user
    Route::get('flights/{flightid}/bookings', [FlightController::class, 'getFlightBookings']); //user
    Route::post('flights/{flightid}/bookings', [FlightController::class, 'addBookingstoFlight']); //user
    Route::post('cars/{carid}/bookings', [CarController::class, 'addBookingstocar']);
    ////Flight
    Route::get('/flights/search', [FlightController::class, 'search'])->name('flights.search');

    ///car
    Route::get('cars/{carid}/bookings', [CarController::class, 'getcarBookings']);
    Route::get('cars//bookings', [CarController::class, 'getBookingcars']);
    Route::get('cars/{id}', [CarController::class, 'show']);
    Route::get('cars', [CarController::class, 'index']);
    Route::get('cars/search', [CarController::class, 'search']);


    //BookingHotel
    Route::get('booking//hotels', [UserController::class, 'getBookingHotels']); //user
    Route::get('hotels/{hotelid}/bookings', [HotelController::class, 'getHotelBookings']); //user
    Route::post('hotels/{hotelId}/bookings', [HotelController::class, 'addBookingstoHotel']); //user

    //Hotel
    Route::get('hotels/{cityName}', [HotelController::class, 'showHotelByCityName']);
    Route::get('hhhh', [HotelController::class, 'ShowMostFamiliarHotels']);
    Route::get('h/{id}', [HotelController::class, 'ShowHotelById']);

    //BookingTour
    Route::get('booking/{bookingid}/tours', [UserController::class, 'getBookingTours']); //user
    Route::get('tours/{tourid}/bookings', [BookingController::class, 'getTourBookings']); //user
    Route::post('tours/{tourId}/bookings', [TourController::class, 'addBookingstoTour']); //user

    //FavoriteTour
    Route::post('tours/{id}/favorite', [TourController::class, 'addToFavorites'])->middleware('auth:sanctum'); //user
    Route::delete('tours/{id}/favorite', [TourController::class, 'removeFromFavorite'])->middleware('auth:sanctum'); //user
    Route::get('t/fa', [TourController::class, 'getFavoriteTours'])->middleware('auth:sanctum'); //user


    //TouristGuide
    Route::post('touristguide', [TouristguideController::class, 'store']);


    ////////////////Admin
    //store
    Route::post('flights', [FlightController::class, 'store'])->middleware('CheckUserRole');
    Route::post('hot', [HotelController::class, 'store'])->middleware('CheckUserRole');
    Route::post('destinations', [DestinationController::class, 'store'])->middleware('CheckUserRole');
    Route::post('tours', [TourController::class, 'store'])->middleware('CheckUserRole');

    Route::post('offers', [OfferController::class, 'store'])->middleware('CheckUserRole');


    //get
    Route::get('hot', [HotelController::class, 'index'])->middleware('CheckUserRole');
    Route::get('flightall', [FlightController::class, 'index'])->middleware('CheckUserRole');
    Route::get('flightone/{id}', [FlightController::class, 'show'])->middleware('CheckUserRole');

    Route::get('t', [TourController::class, 'index'])->middleware('CheckUserRole');
    Route::get('t/{id}', [TourController::class, 'show'])->middleware('CheckUserRole');
    Route::get('d', [DestinationController::class, 'index'])->middleware('CheckUserRole');
    Route::get('d/{id}', [DestinationController::class, 'show'])->middleware('CheckUserRole');
    Route::get('offerg/{id}', [OfferController::class, 'show'])->middleware('CheckUserRole');
    Route::get('offerg', [OfferController::class, 'index'])->middleware('CheckUserRole');


    ///update
    Route::post('desUp/{id}', [DestinationController::class, 'update'])->middleware('CheckUserRole');;
    Route::post('hotUp/{id}', [HotelController::class, 'update'])->middleware('CheckUserRole');;
    Route::post('flUp/{id}', [FlightController::class, 'update'])->middleware('CheckUserRole');;
    Route::post('tourUp/{id}', [TourController::class, 'update'])->middleware('CheckUserRole');;
    Route::post('flUp/{id}', [FlightController::class, 'update'])->middleware('CheckUserRole');;
    Route::post('offUp/{id}', [OfferController::class, 'update'])->middleware('CheckUserRole');;
    Route::post('carUp/{id}', [CarController::class, 'update'])->middleware('CheckUserRole');;




    ///Delete
    Route::delete('desDel/{id}', [DestinationController::class, 'destroy'])->middleware('CheckUserRole');;
    Route::delete('fliDel/{id}', [FlightController::class, 'destroy'])->middleware('CheckUserRole');;
    Route::delete('hotDel/{id}', [HotelController::class, 'destroy'])->middleware('CheckUserRole');;
    Route::delete('tourDel/{id}', [TourController::class, 'destroy'])->middleware('CheckUserRole');;
    Route::delete('offDel/{id}', [OfferController::class, 'destroy'])->middleware('CheckUserRole');;
     Route::delete('carDel/{id}', [CarController::class, 'destroy'])->middleware('CheckUserRole');;



    ////Confirm
    Route::put('/adminCars/{id}', [CarController::class, 'confirm'])->middleware('CheckUserRole');
    Route::put('/adminFlight/{id}', [FlightController::class, 'confirm'])->middleware('CheckUserRole');
    Route::put('/adminHotel/{id}', [HotelController::class, 'confirm'])->middleware('CheckUserRole');

    //touristGuide
    Route::get('destWithTouristGuide', [DestinationController::class, 'getDestinationsWithTouristGuide'])->middleware('TGR');

    Route::post('createwallet', [WalletController::class, 'deposit'])->middleware('CheckUserRole');
    Route::post('withdraw', [WalletController::class, 'withdraw'])->middleware('CheckUserRole');
});
