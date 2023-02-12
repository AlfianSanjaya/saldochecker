// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {
  final ThemeMode themeMode;
  final Locale locale;

  const SettingsState({required this.themeMode, required this.locale});

  bool get isDarkTheme => (themeMode == ThemeMode.dark) ? true : false;

  @override
  String toString() =>
      'SettingsState(themeMode: $themeMode , isDarkTheme: $isDarkTheme)';
}

class SettingsInitial extends SettingsState {
  const SettingsInitial({required ThemeMode themeMode, required Locale locale})
      : super(themeMode: themeMode, locale: locale);
}

class NewSettingsTheme extends SettingsState {
  const NewSettingsTheme({required ThemeMode themeMode, required Locale locale})
      : super(themeMode: themeMode, locale: locale);
}

class NewSettingsLocale extends SettingsState {
  const NewSettingsLocale(
      {required ThemeMode themeMode, required Locale locale})
      : super(themeMode: themeMode, locale: locale);
}
