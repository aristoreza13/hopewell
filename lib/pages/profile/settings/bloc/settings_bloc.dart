import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvents, SettingStates> {
  SettingsBloc() : super(SettingStates()) {
    on<TriggerSettings>(triggerSettings);
  }

  triggerSettings(SettingsEvents event, Emitter<SettingStates> emit) {
    emit(const SettingStates());
  }
}
