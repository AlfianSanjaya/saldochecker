import 'package:flutter/material.dart';
import 'package:saldochecker/models/ticket_information.dart';
import 'package:saldochecker/services/ticket_service.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'strings.dart' as strings;

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key, required this.ticketID}) : super(key: key);
  final String ticketID;

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late TicketService service;
  late Future<TicketInformation> futureTicketInformation;

  @override
  void initState() {
    super.initState();
    service = TicketService();
    futureTicketInformation =
        service.getTicketInformation(http.Client(), widget.ticketID);
  }

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
          const Text(
            strings.titleInfo,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.credit_card,
            ),
            title: const Text(strings.idInfo),
            subtitle: Text(
              data.id,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.directions_bus_filled,
            ),
            title: const Text(strings.valueInfo),
            subtitle: Text(
              data.value.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.history,
            ),
            title: const Text(strings.latestUpdateInfo),
            subtitle: Text(
              formatDate(data.timestamp),
              style: TextStyle(fontWeight: FontWeight.bold),
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
        title: const Text('Informatie'),
      ),
      body: Center(
        child: FutureBuilder<TicketInformation>(
          future: futureTicketInformation,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ticketInformationWidget(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
