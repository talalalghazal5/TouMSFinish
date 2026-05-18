import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/Auth/data/login_model/login_model.dart';
import 'package:wander_wise_app/features/Booking_id/data/booking_id_model.dart';

abstract class BookingIdState extends Equatable {
  const BookingIdState();
  @override
  List<Object> get props => [];
}

class BookingIdInitial extends BookingIdState {}

class BookingIdLoading extends BookingIdState {}

class BookingIdSuccess extends BookingIdState {
  final BookingIdModel bookingIdModel;

  const BookingIdSuccess(this.bookingIdModel);

  @override
  List<Object> get props => [bookingIdModel];

}

class BookingIdFailure extends BookingIdState {
  final String errorMessage;

  const BookingIdFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}