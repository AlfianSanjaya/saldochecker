import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/ticket_information_model.dart';
import '../../domain/entities/ticket_information.dart';

class TicketDataSource {
  final String ticketURI = 'https://www.delijn.be/api';

  Future<TicketInformation> getTicketInformation(
      http.Client client, String id) async {
    final response = await client.get(
      Uri.parse('$ticketURI/saldo-checker/$id'),
    );

    if (response.statusCode == 200) {
      return TicketInformationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch ticket information.');
    }
  }
}
