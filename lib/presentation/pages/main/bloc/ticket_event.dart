part of 'ticket_bloc.dart';

@immutable
abstract class TicketEvent {}

class TicketInformationRequested extends TicketEvent {
  final String id;

  TicketInformationRequested({required this.id});
}
