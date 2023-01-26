import 'package:http/http.dart' as http;

class HttpService {
  static Future<http.Response> getTicketInformation(String id) {
    return http.get(
      Uri.parse('https://www.delijn.be/api/saldo-checker/$id'),
    );
  }
}
