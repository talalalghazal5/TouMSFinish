import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/DestinationsCategory/data/models/destinationModel/destination_model.dart';
import 'package:wander_wise_app/features/DestinationsCategory/logic/VarietyCubit/variety_state.dart';

class VarietyCubit extends Cubit<VarietyState> {
  final ApiService apiService;

  VarietyCubit(this.apiService) : super(VarietyInitial());

  Future<void> getDestinationByType() async {
    emit(VarietyLoading());

    try {
      final response = await apiService.getDestinationByType('variety');

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(VarietyFailure(response['errormessage']));
        return;
      }
      final destinations = (response as List)
          .map((item) => DestinationModel.fromMap(item))
          .toList();
      emit(VarietySuccess(destinations));
    } catch (e) {
      emit(VarietyFailure('there is Unexpected error occurred'));
    }
  }
}