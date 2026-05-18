import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/DestinationsCategory/data/models/destinationModel/destination_model.dart';

abstract class VarietyState extends Equatable {
  const VarietyState();
  @override
  List<Object> get props => [];
}

class VarietyInitial extends VarietyState {}

class VarietyLoading extends VarietyState {}

class VarietySuccess extends VarietyState {
  final List<DestinationModel> destinations;

  const VarietySuccess(this.destinations);

  @override
  List<Object> get props => [destinations];
}

class VarietyFailure extends VarietyState {
  final String errorMessage;

  const VarietyFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
