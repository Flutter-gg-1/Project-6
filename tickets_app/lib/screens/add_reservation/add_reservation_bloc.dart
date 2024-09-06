import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_reservation_event.dart';
part 'add_reservation_state.dart';

class AddReservationBloc
    extends Bloc<AddReservationEvent, AddReservationState> {
  AddReservationBloc() : super(AddReservationInitial()) {
    on<AddReservationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
