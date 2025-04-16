part of "auth_cubit.dart";

sealed class AuthState {
  const AuthState();
}

class AuthStateInit extends AuthState {
  const AuthStateInit();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateSuccess extends AuthState {
  const AuthStateSuccess({required this.id, this.displayName});

  final String id;
  final String? displayName;
}

class AuthStateError extends AuthState {
  const AuthStateError(this.error);

  final Object? error;
}
