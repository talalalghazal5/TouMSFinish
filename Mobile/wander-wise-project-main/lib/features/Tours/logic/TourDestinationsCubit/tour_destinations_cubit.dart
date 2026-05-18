import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Tours/data/TourDestinationModel/tour_destination_model.dart';
import 'package:wander_wise_app/features/Tours/logic/TourDestinationsCubit/tour_destinations_state.dart';

class TourDestinationsCubit extends Cubit<TourDestinationsState> {
  final ApiService apiService;

  TourDestinationsCubit(this.apiService) : super(TourDestinationsInitial());

  Future<void> getDestinationToEachTour(String tourName) async {
    emit(TourDestinationsLoading());

    try {
      final response = await apiService.getDestinationsToEachTour(tourName);

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(TourDestinationsFailure(response['errormessage']));
        return;
      }

      final destinations = (response["destinations"] as List)
          .map((item) => TourDestinationModel.fromMap(item))
          .toList();

      print('DESTINATIONS: $destinations');
      emit(TourDestinationsSuccess(destinations));
    } catch (e) {
      emit(TourDestinationsFailure('there is Unexpected error occurred'));
    }
  }
}
