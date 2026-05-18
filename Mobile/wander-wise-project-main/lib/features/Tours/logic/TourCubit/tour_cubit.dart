import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Tours/data/TourModel/tour_model.dart';
import 'package:wander_wise_app/features/Tours/logic/TourCubit/tour_state.dart';

class TourCubit extends Cubit<TourState> {
  final ApiService apiService;

  final Set<int> favoriteTourIds = {};

  TourCubit(this.apiService) : super(TourInitial());

  Future<void> gettours() async {
    emit(TourLoading());

    try {
      final response = await apiService.getMyTours();

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(TourFailure(response['errormessage']));
        return;
      }
      final tours = (response as List)
          .map((item) => TourModel.fromMap(item))
          .toList();

      final favoriteResponse = await apiService.getFromFavorite();
      print("FAVORITE RESPONSE: $favoriteResponse");

      final favoriteIds = (favoriteResponse as List)
          .map((item) => item['id'] as int)
          .toSet();
      favoriteTourIds
        ..clear()
        ..addAll(favoriteIds);
      // favoriteTourIds.addAll(favoriteIds);

      final updatedTours = tours.map((tour) {
        return tour.copyWith(isFavorite: favoriteTourIds.contains(tour.id));
      }).toList();

      emit(TourSuccess(updatedTours));
    } catch (e) {
      emit(TourFailure('there is Unexpected error occurred'));
    }
  }

  Future<void> addToFavorite(int tourId) async {
    favoriteTourIds.add(tourId);
    emitUpdatedTours();

    try {
      await apiService.addtofavorite(tourId);
    } catch (e) {
      favoriteTourIds.remove(tourId);
      emitUpdatedTours();
    }
  }

  Future<void> removeFromFavorite(int tourId) async {
    favoriteTourIds.remove(tourId);
    emitUpdatedTours();

    try {
      await apiService.removefromFavorite(tourId);
    } catch (e) {
      favoriteTourIds.add(tourId);
      emitUpdatedTours();
    }
  }

  void emitUpdatedTours() {
    final currentState = state;
    if (currentState is TourSuccess) {
      final updatedTours = currentState.tours.map((tour) {
        return tour.copyWith(isFavorite: favoriteTourIds.contains(tour.id));
      }).toList();
      emit(TourSuccess(updatedTours));
    }
  }
}
