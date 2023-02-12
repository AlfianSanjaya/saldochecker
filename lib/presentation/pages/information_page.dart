import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/smart_ticket.dart';
import '../../domain/entities/ticket_information.dart';
import 'main/bloc/ticket_bloc.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key, required this.ticketID}) : super(key: key);
  final String ticketID;

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  String formatDate(int milliseconds) {
    final DateTime timeStamp =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);
    String formattedDate = DateFormat('EEEE d MMM hh:mm:ss').format(timeStamp);
    return formattedDate;
  }

  Widget ticketInformationWidget(TicketInformation data) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.ticketDetailsTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.credit_card,
            ),
            title: Text(AppLocalizations.of(context)!.ticketDetailsHeadingID),
            subtitle: Text(
              data.id,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.directions_bus_filled,
            ),
            title:
                Text(AppLocalizations.of(context)!.ticketDetailsHeadingValue),
            subtitle: Text(
              data.value.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.history,
            ),
            title:
                Text(AppLocalizations.of(context)!.ticketDetailsHeadingUpdate),
            subtitle: Text(
              formatDate(data.timestamp),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ticketHistoryListWidget(data),
        ],
      ),
    );
  }

  Widget ticketHistoryListWidget(TicketInformation data) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Text(
              AppLocalizations.of(context)!.ticketDetailsTitleHistory,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.smartTicketLineJsonList.length,
              itemBuilder: (BuildContext context, int index) {
                SmartTicket currentTicket = data.smartTicketLineJsonList[index];
                return ListTile(
                  title: Text(formatDate(currentTicket.timestamp)),
                  subtitle: Text(
                    AppLocalizations.of(context)!
                        .ticketDetailsListTitleHistory(currentTicket.value),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.ticketDetailsAppBarTitle),
      ),
      body: Center(
        child: BlocBuilder<TicketBloc, TicketState>(
          builder: (context, state) {
            if (state is TicketInformationIsLoading) {
              return const CircularProgressIndicator();
            } else if (state is TicketInformationFetchSuccess) {
              return ticketInformationWidget(state.ticketInformation);
            } else {
              return const Text('error');
            }
          },
        ),
      ),
    );
  }
}
