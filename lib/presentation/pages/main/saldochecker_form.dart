import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../routes/routes.dart';
import 'bloc/ticket_bloc.dart';

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
      return AppLocalizations.of(context)!.inputIsEmptyMessage;
    }
    if (regExp.hasMatch(ticketID)) {
      return null;
    } else {
      return AppLocalizations.of(context)!.inputIsInvalidMessage;
    }
  }

  void onPressed() {
    if (_formKey.currentState!.validate()) {
      String id = _ticketIDController.text;
      //Navigator.of(context).push(_createRoute(id));
      BlocProvider.of<TicketBloc>(context)
          .add(TicketInformationRequested(id: id));

      Navigator.of(context).pushNamed(
        RouteManager.ticketDetailsPage,
        arguments: {
          'ticketID': id,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.mainFormlableTextField,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _ticketIDController,
            validator: validateTicketID,
            decoration: const InputDecoration(
              hintText: 'D002 1B69 8F5B BC2C',
              errorMaxLines: 3,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(AppLocalizations.of(context)!.mainFormbuttonText),
          )
        ],
      ),
    );
  }
}
