import 'smart_ticket.dart';

class TicketInformation {
  final int id;
  final int timestamp;
  final String validationStatus;
  final int value;
  final List<SmartTicket> smartTicketLineJsonList;

  const TicketInformation({
    required this.id,
    required this.timestamp,
    required this.validationStatus,
    required this.value,
    required this.smartTicketLineJsonList,
  });

  factory TicketInformation.fromJson(Map<String, dynamic> json) {
    var list = json['smartticketLineJsonList'] as List;
    List<SmartTicket> ticketList =
        list.map((ticket) => SmartTicket.fromJson(ticket)).toList();
    return TicketInformation(
        id: json['id'],
        timestamp: json['timestamp'],
        validationStatus: json['validationStatus'],
        value: json['value'],
        smartTicketLineJsonList: ticketList);
  }
}
