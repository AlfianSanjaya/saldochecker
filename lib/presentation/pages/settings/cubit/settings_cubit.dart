import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsInitial(
            themeMode: ThemeMode.light, locale: Locale('nl')));

  void toggleTheme(bool value) {
    if (value) {
      emit(NewSettingsTheme(themeMode: ThemeMode.dark, locale: state.locale));
    } else {
      emit(NewSettingsTheme(themeMode: ThemeMode.light, locale: state.locale));
    }
  }

  void toggleLocale(Locale locale) {
    emit(NewSettingsLocale(themeMode: state.themeMode, locale: locale));
  }

  @override
  void onChange(Change<SettingsState> change) {
    // TODO: implement onChange
    print(change);
    super.onChange(change);
  }
}
