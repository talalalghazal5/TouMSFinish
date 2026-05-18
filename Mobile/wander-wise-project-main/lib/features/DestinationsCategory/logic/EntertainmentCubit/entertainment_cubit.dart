import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/DestinationsCategory/data/models/destinationModel/destination_model.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/EntertainmentCubit/entertainment_state.dart';

class EntertainmentCubit extends Cubit<EntertainmentState> {
  final ApiService apiService;

  EntertainmentCubit(this.apiService) : super(EntertainmentInitial());

  Future<void> getDestinationByType() async {
    emit(EntertainmentLoading());

    try {
      final response = await apiService.getDestinationByType('entertainment');

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(EntertainmentFailure(response['errormessage']));
        return;
      }
      final destinations = (response as List)
          .map((item) => DestinationModel.fromMap(item))
          .toList();
      emit(EntertainmentSuccess(destinations));
    } catch (e) {
      emit(EntertainmentFailure('there is Unexpected error occurred'));
    }
  }
}
