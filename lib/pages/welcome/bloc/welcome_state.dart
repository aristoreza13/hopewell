part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeState {}

class WelcomePageCount extends WelcomeState {
  int page;
  WelcomePageCount({this.page = 0});
}
