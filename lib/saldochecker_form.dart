import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/src/client.dart';
import 'package:saldochecker/information_page.dart';
import 'package:saldochecker/models/ticket_information.dart';
import 'package:saldochecker/services/ticket_service.dart';
import 'strings.dart' as strings;

class SaldoCheckerForm extends StatefulWidget {
  const SaldoCheckerForm({Key? key}) : super(key: key);

  @override
  State<SaldoCheckerForm> createState() => SaldoCheckerFormState();
}

class SaldoCheckerFormState extends State<SaldoCheckerForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _ticketIDController;

  @override
  void initState() {
    super.initState();
    _ticketIDController = TextEditingController();
    // TODO: remove when done testing
    _ticketIDController.text = 'D0021B698F5BBC2C';
  }

  @override
  void dispose() {
    _ticketIDController.dispose();
    super.dispose();
  }

  String? validateTicketID(String? ticketID) {
    RegExp regExp = RegExp(r'^[A-Z0-9]{16}$');
    if (ticketID == null || ticketID.isEmpty) {
      return strings.inputIsEmptyMessage;
    }
    if (regExp.hasMatch(ticketID)) {
      return null;
    } else {
      return strings.inputIsInvalidMessage;
    }
  }

  void onPressed() {
    if (_formKey.currentState!.validate()) {
      String id = _ticketIDController.text;
      Navigator.of(context).push(_createRoute(id));
    }
  }

  Route _createRoute(id) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          InformationPage(ticketID: id),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: const Text(
              strings.lableTextfField,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            // TODO: enter with capitals and space
            child: TextFormField(
              controller: _ticketIDController,
              validator: validateTicketID,
              decoration: const InputDecoration(
                hintText: 'D002 1B69 8F5B BC2C',
                border: OutlineInputBorder(),
                errorMaxLines: 3,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text(strings.buttonText),
          )
        ],
      ),
    );
  }
}
