import 'package:flutter/material.dart';
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
      print('Sending the id $id');
    }
    // TODO: send to api
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
              'Nummer vervoerbewijs op elektronische kaart',
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
            child: const Text('Check'),
          )
        ],
      ),
    );
  }
}
