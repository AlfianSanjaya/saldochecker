part of 'ticket_bloc.dart';

@immutable
abstract class TicketState {}

class TicketInitial extends TicketState {}

class TicketInformationFetchSuccess extends TicketState {
  TicketInformation ticketInformation;

  TicketInformationFetchSuccess({required this.ticketInformation});
}

class TicketInformationIsLoading extends TicketState {}
