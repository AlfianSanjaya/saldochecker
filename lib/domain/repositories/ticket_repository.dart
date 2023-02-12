import '../entities/ticket_information.dart';

abstract class ITicketRepository {
  Future<TicketInformation> getTicketInformation(String id);
}
