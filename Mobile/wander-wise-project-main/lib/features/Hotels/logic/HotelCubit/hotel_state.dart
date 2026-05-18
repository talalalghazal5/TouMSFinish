import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/Hotels/data/hotel_model.dart';

abstract class HotelState extends Equatable {
  const HotelState();
  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelSuccess extends HotelState {
  final List<HotelModel> hotelModel;

  const HotelSuccess(this.hotelModel);

  @override
  List<Object> get props => [hotelModel];
}

class HotelFailure extends HotelState {
  final String errorMessage;

  const HotelFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
