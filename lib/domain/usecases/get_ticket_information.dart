import 'package:saldochecker/domain/entities/ticket_information.dart';
import 'package:saldochecker/domain/repositories/ticket_repository.dart';

class GetTicketInformation {
  final ITicketRepository repository;

  GetTicketInformation(this.repository);

  Future<TicketInformation> call(String id) async {
    try {
      TicketInformation ticket = await repository.getTicketInformation(id);
      return ticket;
    } on Exception catch (e) {
      throw Exception('Failed to fetch ticket information.');
    }
  }
}
