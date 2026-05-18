import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/DestinationsCategory/data/models/destinationModel/destination_model.dart';

abstract class HistoricalState extends Equatable {
  const HistoricalState();
  @override
  List<Object> get props => [];
}

class HistoricalInitial extends HistoricalState {}

class HistoricalLoading extends HistoricalState {}

class HistoricalSuccess extends HistoricalState {
  final List<DestinationModel> destinations;

  const HistoricalSuccess(this.destinations);

  @override
  List<Object> get props => [destinations];
}

class HistoricalFailure extends HistoricalState {
  final String errorMessage;

  const HistoricalFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
