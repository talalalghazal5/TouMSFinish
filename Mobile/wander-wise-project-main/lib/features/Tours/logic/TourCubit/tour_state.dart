import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/Tours/data/TourModel/tour_model.dart';

abstract class TourState extends Equatable {
  const TourState();
  @override
  List<Object> get props => [];
}

class TourInitial extends TourState {}

class TourLoading extends TourState {}

class TourSuccess extends TourState {
  final List<TourModel> tours;

  const TourSuccess(this.tours);

  @override
  List<Object> get props => [tours];
}

class TourFailure extends TourState {
  final String errorMessage;

  const TourFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}