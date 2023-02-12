import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../data/datasources/ticket_datasource.dart';
import '../../../../data/repositories/ticket_repository.dart';
import '../../../../domain/entities/ticket_information.dart';
import '../../../../domain/usecases/get_ticket_information.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final GetTicketInformation getTicketInformation = GetTicketInformation(
    TicketRepository(
      ticketDataSource: TicketDataSource(),
    ),
  );

  TicketBloc() : super(TicketInitial()) {
    on<TicketInformationRequested>((event, emit) async {
      emit(TicketInformationIsLoading());

      TicketInformation ticketInformation =
          await getTicketInformation.call(event.id);

      emit(TicketInformationFetchSuccess(ticketInformation: ticketInformation));
    });
  }
}
