import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Hotels/data/hotel_model.dart';
import 'package:wander_wise_app/features/Hotels/logic/HotelCubit/hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final ApiService apiService;

  HotelCubit(this.apiService) : super(HotelInitial());

  Future<void> getHotels() async {
    emit(HotelLoading());

    try {
      final response = await apiService.getHotels();

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(HotelFailure(response['errormessage']));
        return;
      }
      final hotels = (response as List)
          .map((item) => HotelModel.fromMap(item))
          .toList();

      print('DESTINATIONS: $hotels');
      emit(HotelSuccess(hotels));
    } catch (e) {
      emit(HotelFailure('there is Unexpected error occurred'));
    }
  }
}
