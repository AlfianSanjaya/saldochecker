import 'package:saldochecker/domain/entities/smart_ticket.dart';

class SmartTicketModel extends SmartTicket {
  SmartTicketModel({
    required int timestamp,
    required int value,
  }) : super(timestamp, value);

  factory SmartTicketModel.fromJson(Map<String, dynamic> json) {
    return SmartTicketModel(
      timestamp: json['timestamp'],
      value: json['value'],
    );
  }
}
