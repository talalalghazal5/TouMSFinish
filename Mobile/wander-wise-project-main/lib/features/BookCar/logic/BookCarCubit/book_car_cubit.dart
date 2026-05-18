import 'package:bloc/bloc.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/BookCar/data/book_car_model.dart';
import 'package:wander_wise_app/features/BookCar/logic/BookCarCubit/book_car_state.dart';

class BookCarCubit extends Cubit<BookCarState> {
  final ApiService apiService;
  BookCarCubit(this.apiService) : super(BookCarInitial());

  Future<void> storeCar({
    required String pickUpLocation,
    required String dropOffLocation,
    required String pickupTime,
    required DateTime pickdate,
    required int bookingId,
  }) async {
    emit(BookCarLoading());

    try {
      final response = await apiService.storeCar({
        'pickUpLocation': pickUpLocation,
        'dropOffLocation': dropOffLocation,
        'pickupTime': pickupTime,
        'pickdate': pickdate.toIso8601String(),
        'booking_id': bookingId,
      });

      print('Response type: ${response.runtimeType}');
      print('Response value: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey('errormessage')) {
        emit(BookCarFailure(response['errormessage']));
        return;
      }

      final bookCarModel = BookCarModel.fromMap(response);

      emit(BookCarSuccess(bookCarModel));
    } catch (e, st) {
      print('Error in storeCar: $e');
      print(st);
      emit(BookCarFailure('there is Unexpected error occurred'));
    }
  }
}
