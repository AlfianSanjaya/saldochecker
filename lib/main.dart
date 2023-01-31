import 'package:flutter/material.dart';
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
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Saldochecker"),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            child: SaldoCheckerForm(),
          ),
        ),
      ),
    );
  }

  void onPressed() {
    // TODO: Implement OnPressed function
  }
}
