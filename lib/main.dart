import 'package:flutter/material.dart';
import 'package:saldochecker/routes/routes.dart';
import 'package:saldochecker/saldochecker_form.dart';

void main() {
  runApp(const SaldoChecker());
}

class SaldoChecker extends StatelessWidget {
  const SaldoChecker({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaldoChecker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      initialRoute: RouteManager.homePage,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }

  void onPressed() {
    // TODO: Implement OnPressed function
  }
}
