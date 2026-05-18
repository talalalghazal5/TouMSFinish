import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/DestinationsCategory/data/models/destinationModel/destination_model.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/HistoricalCubit/historical_state.dart';

class HistoricalCubit extends Cubit<HistoricalState> {
  final ApiService apiService;

  HistoricalCubit(this.apiService) : super(HistoricalInitial());

  Future<void> getDestinationByType() async {
    emit(HistoricalLoading());

    try {
      final response = await apiService.getDestinationByType('historical');

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(HistoricalFailure(response['errormessage']));
        return;
      }
      final destinations = (response as List)
          .map((item) => DestinationModel.fromMap(item))
          .toList();

      print('DESTINATIONS: $destinations');
      emit(HistoricalSuccess(destinations));
    } catch (e) {
      emit(HistoricalFailure('there is Unexpected error occurred'));
    }
  }
}
