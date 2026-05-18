import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/BookCar/data/book_car_model.dart';
import 'package:wander_wise_app/features/Booking_id/data/booking_id_model.dart';

abstract class BookCarState extends Equatable {
  const BookCarState();
  @override
  List<Object> get props => [];
}

class BookCarInitial extends BookCarState {}

class BookCarLoading extends BookCarState {}

class BookCarSuccess extends BookCarState {
  final BookCarModel bookCarModel;

  const BookCarSuccess(this.bookCarModel);

  @override
  List<Object> get props => [bookCarModel];

}

class BookCarFailure extends BookCarState {
  final String errorMessage;

  const BookCarFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}