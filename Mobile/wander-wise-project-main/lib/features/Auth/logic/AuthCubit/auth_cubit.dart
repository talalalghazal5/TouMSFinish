
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  void login() {
    emit(state.copyWith(status: AuthStatus.loggedIn));
  }

  void continueAsGuest() {
    emit(state.copyWith(status: AuthStatus.guest));
  }

  void logout() {
    emit(state.copyWith(status: AuthStatus.guest));
  }
}
