import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsInitial(themeMode: ThemeMode.light));

  void toggleTheme(bool value) {
    if (value) {
      emit(const NewSettings(themeMode: ThemeMode.dark));
    } else {
      emit(const NewSettings(themeMode: ThemeMode.light));
    }
  }

  @override
  void onChange(Change<SettingsState> change) {
    // TODO: implement onChange
    print(change);
    super.onChange(change);
  }
}
