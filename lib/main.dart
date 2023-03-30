import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saldochecker/presentation/pages/settings/cubit/settings_cubit.dart';

import 'presentation/pages/main/bloc/ticket_bloc.dart';
import 'presentation/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const SaldoChecker());
}

class SaldoChecker extends StatelessWidget {
  const SaldoChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TicketBloc(),
        ),
        BlocProvider(
          create: (_) => SettingsCubit(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.amber,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: state.themeMode,
            initialRoute: RouteManager.homePage,
            onGenerateRoute: RouteManager.generateRoute,
          );
        },
      ),
    );
  }
}
