import 'package:flutter/material.dart';

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
            child: Column(
              children: [
                Container(
                  child: const Text(
                    'Nummer vervoerbewijs op elektronische kaart',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 500,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'D0021B698F5BBC2C',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  child: const Text('Check'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed() {
    // TODO: Implement OnPressed function
  }
}
