import 'package:bloc/bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Booking_id/data/booking_id_model.dart';
import 'package:wander_wise_app/features/Booking_id/logic/Booking_IdCubit/booking_id_state.dart';

class BookingIdCubit extends Cubit<BookingIdState> {
  final ApiService apiService;
  BookingIdCubit(this.apiService) : super(BookingIdInitial());

  Future<void> getBookingId({
    required String bookingFor,
    required String bookingStatus,
    required int number,
  }) async {
    emit(BookingIdLoading());

    try {
      final response = await apiService.postToGetBookingId({
        'bookingFor': bookingFor,
        'bookingStatus': bookingStatus,
        'numbers': number,
      });

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(BookingIdFailure(response['errormessage']));
        return;
      }

      final bookingIdModel = BookingIdModel.fromMap(response);

      emit(BookingIdSuccess(bookingIdModel));
    } catch (e) {
      emit(BookingIdFailure('there is Unexpected error occurred'));
    }
  }
}
