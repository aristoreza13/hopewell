import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmEvent>(_confirmEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<RegisterState> emit) {
    // print("${event.username}");
    emit(state.copyWith(username: event.username));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    // print("${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    // print("${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _confirmEvent(ConfirmEvent event, Emitter<RegisterState> emit) {
    // print("${event.confirmPassword}");
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
