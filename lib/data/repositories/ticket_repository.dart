import 'package:saldochecker/domain/entities/ticket_information.dart';
import 'package:saldochecker/domain/repositories/ticket_repository.dart';
import '../datasources/ticket_datasource.dart';
import 'package:http/http.dart' as http;

class TicketRepository implements ITicketRepository {
  final TicketDataSource ticketDataSource;

  TicketRepository({
    required this.ticketDataSource,
  });

  @override
  Future<TicketInformation> getTicketInformation(String id) async {
    return await ticketDataSource.getTicketInformation(http.Client(), id);
  }
}
