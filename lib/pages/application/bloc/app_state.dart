part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {
  final int index;
  AppInitial({this.index = 0});
}
