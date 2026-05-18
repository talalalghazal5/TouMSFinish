import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/widgets/animations_views/first_animation_view.dart';
import 'package:wander_wise_app/core/widgets/animations_views/transitions.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/login_view.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/register_view.dart';
import 'package:wander_wise_app/features/BookCar/presentation/views/welcome_car_view.dart';
import 'package:wander_wise_app/features/Booking_id/presentation/views/booking_id_view.dart';
import 'package:wander_wise_app/features/Favorite/presentaion/views/favorite_trips_view.dart';
import 'package:wander_wise_app/features/Flight/presentaion/views/flight_booking_screen.dart';
import 'package:wander_wise_app/features/FlightBook/presentation/views/flight_book_view.dart';
import 'package:wander_wise_app/core/widgets/animations_views/book_flight_animation_view.dart';
import 'package:wander_wise_app/features/Home/presentation/views/home_view.dart';
import 'package:wander_wise_app/features/Hotels/presentaion/views/hotel_details_view.dart';
import 'package:wander_wise_app/features/Hotels/presentaion/views/hotel_view.dart';
import 'package:wander_wise_app/features/Hotels/presentaion/widgets/hotel_booking_screen.dart';
import 'package:wander_wise_app/features/Profile/presentation/views/profile_view.dart';
import 'package:wander_wise_app/features/Splash/presentation/views/splash_view.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/category_view.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/entertainment_trips_view.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/historical_trips_view.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/variety_trips_view.dart';
import 'package:wander_wise_app/features/DestinationsCategory/presentation/views/trip_details_view.dart';
import 'package:wander_wise_app/features/Support/presentation/views/faq_support_view.dart';
import 'package:wander_wise_app/features/Tours/presentation/views/destinations_to_each_tour_view.dart';
import 'package:wander_wise_app/features/Tours/presentation/views/tour_destination_details_view.dart';
import 'package:wander_wise_app/features/Tours/presentation/views/tours_view.dart';

import 'package:wander_wise_app/features/welcome/presentation/views/welcome_pager_view.dart';

abstract class AppRouter {
  static const kWelcomePagerView = '/WelcomePagerView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kProfileView = '/ProfileView';
  static const kCategoryView = '/CategoryView';
  static const kVarietyTripsView = '/VarietyTripsView';
  static const kHistoricalTripsView = '/HistoricalTripsView';
  static const kEntertainmentTripsView = '/EntertainmentTripsView';
  static const kTripDetailsView = '/TripDetailsView';
  static const kWelcomeCarView = '/WelcomeCarView';
  static const kFlightBookView = '/FlightBookView';
  static const kBookFlightAnimation = '/BookFlightAnimation';
  static const kFirstAnimationView = '/FirstAnimationView';
  static const kToursView = '/ToursView';
  static const kFAQSupportView = '/FAQSupportView';
  static const kDestinationsToEachTourView = '/DestinationsToEachTourView';
  static const kBookingIdView = '/BookingIdView';
  static const kTourDestinationDetailsView = '/TourDestinationDetailsView';
  static const kHomeScreen = '/HomeScreen';
  static const kHotelsScreen = '/HotelsScreen';
  static const kHotelDetailsScreen = '/HotelDetailsScreen';
  static const kHotelBookingScreen = '/HotelBookingScreen';
  static const kFlightBookingScreen = '/FlightBookingScreen';
  static const kFavoriteTripsView  = '/FavoriteTripsView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kWelcomePagerView,
        builder: (context, state) => const WelcomePagerView(),
      ),
      GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) => fadePage(const LoginView(), state),
      ),
      GoRoute(
        path: kRegisterView,
        pageBuilder: (context, state) => fadePage(const RegisterView(), state),
      ),
      GoRoute(
        path: kProfileView,
        pageBuilder: (context, state) =>
            slideTransitionPage(ProfileView(), state),
      ),
      GoRoute(
        path: kCategoryView,
        builder: (context, state) => const CategoryView(),
      ),
      GoRoute(
        path: kVarietyTripsView,
        builder: (context, state) => const VarietyTripsView(),
      ),
      GoRoute(
        path: kHistoricalTripsView,
        builder: (context, state) => const HistoricalTripsView(),
      ),
      GoRoute(
        path: kEntertainmentTripsView,
        builder: (context, state) => const EntertainmentTripsView(),
      ),
      GoRoute(
        path: kTripDetailsView,
        builder: (context, state) => const TripDetailsView(),
      ),
      GoRoute(
        path: kWelcomeCarView,
        builder: (context, state) => const WelcomeCarView(),
      ),

      GoRoute(
        path: kFlightBookView,
        builder: (context, state) => const FlightBookView(),
      ),
      GoRoute(
        path: kBookFlightAnimation,
        builder: (context, state) => const BookFlightAnimation(),
      ),
      GoRoute(
        path: kFirstAnimationView,
        builder: (context, state) => const FirstAnimationView(),
      ),
      GoRoute(path: kToursView, builder: (context, state) => const ToursView()),
      GoRoute(
        path: kFAQSupportView,
        builder: (context, state) => const FAQSupportView(),
      ),
      GoRoute(
        path: kDestinationsToEachTourView,
        builder: (context, state) => const DestinationsToEachTourView(),
      ),
      GoRoute(
        path: kBookingIdView,
        builder: (context, state) => const BookingIdView(),
      ),
      GoRoute(
        path: kTourDestinationDetailsView,
        builder: (context, state) => const TourDestinationDetailsView(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kHotelsScreen,
        builder: (context, state) => const HotelsScreen(),
      ),
      GoRoute(
        path: kHotelDetailsScreen,
        builder: (context, state) => const HotelDetailsScreen(),
      ),
      GoRoute(
        path: kHotelBookingScreen,
        builder: (context, state) => const HotelBookingScreen(),
      ),
      GoRoute(
        path: kFlightBookingScreen,
        builder: (context, state) => const FlightBookingScreen(),
      ),
       GoRoute(
        path: kFavoriteTripsView,
        builder: (context, state) => const FavoriteTripsView(),
      ),
    ],
  );
}
