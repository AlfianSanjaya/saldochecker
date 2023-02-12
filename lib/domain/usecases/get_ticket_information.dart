import '../entities/ticket_information.dart';
import '../repositories/ticket_repository.dart';

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
