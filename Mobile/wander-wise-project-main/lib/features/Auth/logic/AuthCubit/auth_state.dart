enum AuthStatus { guest, loggedIn }

class AuthState {
  final AuthStatus status;

  const AuthState({required this.status});

  
  factory AuthState.initial() => AuthState(status: AuthStatus.guest);

  AuthState copyWith({AuthStatus? status}) {
    return AuthState(
      status: status ?? this.status,
    );
  }
}
