import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saldochecker/models/ticket_information.dart';

class TicketService {
  final String ticketURI = 'https://www.delijn.be/api';
  Future<TicketInformation> getTicketInformation(
      http.Client client, String id) async {
    final response = await client.get(
      Uri.parse('$ticketURI/saldo-checker/$id'),
    );

    if (response.statusCode == 200) {
      return TicketInformation.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch ticket information.');
    }
  }
}
