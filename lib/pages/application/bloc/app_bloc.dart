import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppInitial> {
  AppBloc() : super(AppInitial()) {
    on<BottomTabEvent>((event, emit) {
      print("tapped index is ${event.index}");
      emit(AppInitial(index: event.index));
    });
  }
}
