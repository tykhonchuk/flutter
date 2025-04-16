import "package:flutter_bloc/flutter_bloc.dart";

part "auth_state.dart";

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthStateInit());

  void signIn(String email, String password) {
    emit(const AuthStateLoading());

    Future.delayed(const Duration(seconds: 5), () {
      if (email == "test@test.pl") {
        if (password == "password") {
          emit(const AuthStateSuccess(id: "123", displayName: "John Doe"));
          return;
        } else {
          emit(const AuthStateError("Invalid password"));
          return;
        }
      } else {
        emit(const AuthStateError("Invalid email"));
        return;
      }

      emit(const AuthStateError("Unexpected error"));
    });
  }
}
