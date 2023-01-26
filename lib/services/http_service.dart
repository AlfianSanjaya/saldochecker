import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saldochecker/models/ticket_information.dart';

class HttpService {
  static Future<TicketInformation> getTicketInformation(
      http.Client client, String id) async {
    final response = await client.get(
      Uri.parse('https://www.delijn.be/api/saldo-checker/$id'),
    );

    if (response.statusCode == 200) {
      return TicketInformation.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch ticket information.');
    }
  }
}
