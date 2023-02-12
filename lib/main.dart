import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saldochecker/presentation/pages/settings/cubit/settings_cubit.dart';

import 'presentation/pages/main/bloc/ticket_bloc.dart';
import 'presentation/routes/routes.dart';

void main() {
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
            //locale: context.watch<SettingsData>().currentLocale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.amber,
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
