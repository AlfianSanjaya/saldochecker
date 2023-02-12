import 'smart_ticket.dart';

class TicketInformation {
  final String id;
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
}
