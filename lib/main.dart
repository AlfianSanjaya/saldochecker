import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldochecker/models/settings_data.dart';
import 'package:saldochecker/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

void main() {
  runApp(const SaldoChecker());
}

class SaldoChecker extends StatelessWidget {
  const SaldoChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsData()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Saldochecker',
          locale: context.watch<SettingsData>().currentLocale,
          supportedLocales: const [
            Locale('nl', 'NL'),
            Locale('en', 'US'),
          ],
          localizationsDelegates: const [
            // A class which loads the translations from JSON files
            AppLocalizations.delegate,
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // Returns a locale which will be used by the app
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            // If the locale of the device is not supported, use the first one
            // from the list (English, in this case).
            return supportedLocales.first;
          },
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: context.watch<SettingsData>().currentThemeMode,
          initialRoute: RouteManager.homePage,
          onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );
  }
}
