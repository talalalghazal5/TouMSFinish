import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/Tours/data/TourDestinationModel/tour_destination_model.dart';

abstract class TourDestinationsState extends Equatable {
  const TourDestinationsState();
  @override
  List<Object> get props => [];
}

class TourDestinationsInitial extends TourDestinationsState {}

class TourDestinationsLoading extends TourDestinationsState {}

class TourDestinationsSuccess extends TourDestinationsState {
  final List<TourDestinationModel> tourDestinationModel;

  const TourDestinationsSuccess(this.tourDestinationModel);

  @override
  List<Object> get props => [tourDestinationModel];
}

class TourDestinationsFailure extends TourDestinationsState {
  final String errorMessage;

  const TourDestinationsFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}