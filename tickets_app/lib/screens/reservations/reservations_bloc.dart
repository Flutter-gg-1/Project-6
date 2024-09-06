import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reservations_event.dart';
part 'reservations_state.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  ReservationsBloc() : super(ReservationsInitial()) {
    on<ReservationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
