import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key, required this.ticketID}) : super(key: key);
  final String ticketID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informatie'),
      ),
      body: Center(
        child: Text(ticketID),
      ),
    );
  }
}
