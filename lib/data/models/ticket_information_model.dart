import '../../domain/entities/smart_ticket.dart';
import '../../domain/entities/ticket_information.dart';
import 'smart_ticket_model.dart';

class TicketInformationModel extends TicketInformation {
  TicketInformationModel(
      {required String id,
      required int timestamp,
      required String validationStatus,
      required int value,
      required List<SmartTicket> smartTicketLineJsonList})
      : super(
            id: id,
            timestamp: timestamp,
            validationStatus: validationStatus,
            value: value,
            smartTicketLineJsonList: smartTicketLineJsonList);

  factory TicketInformationModel.fromJson(Map<String, dynamic> json) {
    var list = json['smartticketLineJsonList'] as List;
    List<SmartTicket> ticketList =
        list.map((ticket) => SmartTicketModel.fromJson(ticket)).toList();
    return TicketInformationModel(
        id: json['id'],
        timestamp: json['timestamp'],
        validationStatus: json['validationStatus'],
        value: json['value'],
        smartTicketLineJsonList: ticketList);
  }
}
