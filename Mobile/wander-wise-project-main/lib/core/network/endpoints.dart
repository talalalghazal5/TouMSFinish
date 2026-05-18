class Endpoints {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  static const String imageBaseUrl = 'http://127.0.0.1:8000/storage/';
  static String token = '';
  static String userName = '';
  static const String login = '/login';
  static const String register = '/register';
  static const String postProfile = '/profile';
  static const String updateProfile = '/updateprofile';
  // static const String getDestinationByType = '/destinations/historical';
  static const String getProfile = '/getProfile';
  static const String getallTours = '/t';
  static const String getFaqSupport = '/userSupports';
  // static const String addToFavorite = '/tours/2/favorite';
  static const String getFromFavorite = '/t/fa';
  static const String postTogetBookingId = '/bookings';
  static const String storeCar = '/cars';
  static const String getOffers = '/offer/tours';
  static const String getHotels = '/hot';
  // static const String storeHotel = '/hotels/1/bookings';

  // static const String getDestinationsToEachTour = '/toursDestinations/Italy';
}
