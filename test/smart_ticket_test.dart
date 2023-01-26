import 'package:saldochecker/models/smart_ticket.dart';
import 'package:test/test.dart';

void main() {
  group('Smart Ticket', () {
    test('Create smart ticket instance', () {
      SmartTicket smartTicket = SmartTicket(1670683731806, 9);

      expect(smartTicket.timestamp, 1670683731806);
      expect(smartTicket.value, 9);
    });
    test('Create smart ticket instance by decoding json', () {
      Map<String, dynamic> json = {"timestamp": 1670683731806, "value": 9};
      SmartTicket smartTicket = SmartTicket.fromJson(json);

      expect(smartTicket.timestamp, 1670683731806);
      expect(smartTicket.value, 9);
    });
  });
}
