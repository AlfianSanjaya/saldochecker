import 'package:saldochecker/data/models/ticket_information_model.dart';
import 'package:saldochecker/domain/entities/smart_ticket.dart';
import 'package:saldochecker/domain/entities/ticket_information.dart';
import 'package:test/test.dart';

void main() {
  group("Ticket information", () {
    test("Create object by decoding json", () {
      Map<String, dynamic> json = {
        "id": "D0021B698F5BBC2C",
        "smartticketLineJsonList": [
          {"timestamp": 1670683731806, "value": 9},
          {"timestamp": 1670683733004, "value": 8},
          {"timestamp": 1671885338496, "value": 7},
          {"timestamp": 1671899534292, "value": 6},
          {"timestamp": 1672140337210, "value": 5},
          {"timestamp": 1672163866819, "value": 4},
          {"timestamp": 1674204467333, "value": 3},
          {"timestamp": 1674216165887, "value": 2}
        ],
        "timestamp": 1674216165887,
        "validationStatus": "OK",
        "value": 2
      };

      dynamic ticketInformation = TicketInformationModel.fromJson(json);

      expect(ticketInformation, isA<TicketInformation>());
      expect(ticketInformation.id, "D0021B698F5BBC2C");
      expect(ticketInformation.timestamp, 1674216165887);
      expect(ticketInformation.validationStatus, "OK");
      expect(ticketInformation.value, 2);
      expect(
          ticketInformation.smartTicketLineJsonList, isA<List<SmartTicket>>());

      List<SmartTicket> smartTickets =
          ticketInformation.smartTicketLineJsonList;
      expect(smartTickets[0].timestamp, 1670683731806);
      expect(smartTickets[0].value, 9);
      expect(smartTickets[1].timestamp, 1670683733004);
      expect(smartTickets[1].value, 8);
      expect(smartTickets[2].timestamp, 1671885338496);
      expect(smartTickets[2].value, 7);
      expect(smartTickets.last.timestamp, 1674216165887);
      expect(smartTickets.last.value, 2);
    });
  });
}
