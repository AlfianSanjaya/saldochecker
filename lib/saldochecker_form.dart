import 'package:flutter/material.dart';

class SaldoCheckerForm extends StatefulWidget {
  const SaldoCheckerForm({Key? key}) : super(key: key);

  @override
  State<SaldoCheckerForm> createState() => _SaldoCheckerFormState();
}

class _SaldoCheckerFormState extends State<SaldoCheckerForm> {
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

  String? validateTicketID(ticketID) {
    if (ticketID == null || ticketID.isEmpty) {
      return 'Nummer is vereist';
    }
    // TODO: add regex check
    return null;
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
            // TODO: enter with capitals and space
            width: 500,
            child: TextFormField(
              controller: _ticketIDController,
              validator: validateTicketID,
              decoration: const InputDecoration(
                hintText: 'D002 1B69 8F5B BC2C',
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
    );
  }
}
