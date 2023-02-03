import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldochecker/models/settings_data.dart';
import 'package:saldochecker/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          locale: context.watch<SettingsData>().currentLocale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
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
