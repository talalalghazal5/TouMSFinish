import 'package:equatable/equatable.dart';
import 'package:wander_wise_app/features/Auth/data/login_model/login_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  const LoginSuccess(this.loginModel);

  @override
  List<Object> get props => [loginModel];

}

class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
