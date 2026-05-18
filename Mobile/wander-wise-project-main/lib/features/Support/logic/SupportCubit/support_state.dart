import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/Support/data/support_model.dart';

abstract class SupportState extends Equatable {
  const SupportState();
  @override
  List<Object> get props => [];
}

class SupportInitial extends SupportState {}

class SupportLoading extends SupportState {}

class SupportSuccess extends SupportState {
  final List<SupportModel> supports;

  const SupportSuccess(this.supports);

  @override
  List<Object> get props => [supports];
}

class SupportFailure extends SupportState {
  final String errorMessage;

  const SupportFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}