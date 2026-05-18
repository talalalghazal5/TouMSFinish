import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/Auth/data/register_model/register_model.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterModel registerModel;

  const RegisterSuccess(this.registerModel);

  @override
  List<Object> get props => [registerModel];
}

class RegisterFailure extends RegisterState {
  final String errorMessage;

  const RegisterFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
