import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Hotels/logic/BookHotelCubit/book_hotel_state.dart';

class BookHotelCubit extends Cubit<BookHotelState> {
  final ApiService apiService;

  BookHotelCubit(this.apiService) : super(BookHotelInitial());

  Future<void> storeHotel({
    required String bookingId,
    required int hotelId,
  }) async {
    emit(BookHotelLoading());

    try {
      final response = await apiService.storeHotel({
        "booking_id": bookingId,
      }, hotelId);

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(BookHotelFailure(response['errormessage']));
        return;
      }
      emit(BookHotelSuccess("Booking done ,waiting for payment"));
    } catch (e) {
      emit(BookHotelFailure('there is Unexpected error occurred'));
    }
  }
}
