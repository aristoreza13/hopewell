import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomePageCount> {
  WelcomeBloc() : super(WelcomePageCount()) {
    on<WelcomeEvent>((event, emit) {
      // TODO: implement event handler
      emit(WelcomePageCount(page: state.page));
    });
  }
}
