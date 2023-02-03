import 'package:flutter/material.dart';
import 'package:saldochecker/routes/routes.dart';
import 'package:saldochecker/saldochecker_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.mainTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteManager.settingsPage);
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          child: const SaldoCheckerForm(),
        ),
      ),
    );
  }
}
