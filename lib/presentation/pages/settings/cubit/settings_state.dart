// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {
  final ThemeMode themeMode;

  const SettingsState({required this.themeMode});

  bool get isDarkTheme => (themeMode == ThemeMode.dark) ? true : false;

  @override
  String toString() =>
      'SettingsState(themeMode: $themeMode , isDarkTheme: $isDarkTheme)';
}

class SettingsInitial extends SettingsState {
  const SettingsInitial({required ThemeMode themeMode})
      : super(themeMode: themeMode);
}

class NewSettings extends SettingsState {
  const NewSettings({required ThemeMode themeMode})
      : super(themeMode: themeMode);
}
