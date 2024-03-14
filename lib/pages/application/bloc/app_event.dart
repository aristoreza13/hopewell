part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

class BottomTabEvent extends AppEvent {
  // get a value to save to AppState
  final int index;
  const BottomTabEvent(this.index) : super();
}
