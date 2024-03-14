part of 'sign_in_bloc.dart';

class SignInState {
  final String email;
  final String password;
  final int nik;

  const SignInState({this.email = "", this.password = "", this.nik = 0});

  SignInState copyWith({String? email, String? password, int? nik}) {
    return SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        nik: nik ?? this.nik);
  }
}
