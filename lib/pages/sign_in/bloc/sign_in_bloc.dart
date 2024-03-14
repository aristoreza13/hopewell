import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  // write handler
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    print('Email is ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    print('Password is ${event.password}');
    emit(state.copyWith(password: event.password));
  }

  void _nikEvent(NikEvent event, Emitter<SignInState> emit) {
    print('NIK is ${event.nik}');
    emit(state.copyWith(nik: event.nik));
  }
}
