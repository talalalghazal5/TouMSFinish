import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/DestinationsCategory/data/models/destinationModel/destination_model.dart';

abstract class EntertainmentState extends Equatable {
  const EntertainmentState();
  @override
  List<Object> get props => [];
}

class EntertainmentInitial extends EntertainmentState {}

class EntertainmentLoading extends EntertainmentState {}

class EntertainmentSuccess extends EntertainmentState {
  final List<DestinationModel> destinations;

  const EntertainmentSuccess(this.destinations);

  @override
  List<Object> get props => [destinations];
}

class EntertainmentFailure extends EntertainmentState {
  final String errorMessage;

  const EntertainmentFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
