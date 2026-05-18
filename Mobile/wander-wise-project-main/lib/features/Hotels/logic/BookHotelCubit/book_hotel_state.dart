import 'package:equatable/equatable.dart';

abstract class BookHotelState extends Equatable {
  const BookHotelState();
  @override
  List<Object> get props => [];
}

class BookHotelInitial extends BookHotelState {}

class BookHotelLoading extends BookHotelState {}

class BookHotelSuccess extends BookHotelState {
  final String message;

  const BookHotelSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class BookHotelFailure extends BookHotelState {
  final String errorMessage;

  const BookHotelFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
