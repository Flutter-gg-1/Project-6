import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_reservation_event.dart';
part 'edit_reservation_state.dart';

class EditReservationBloc
    extends Bloc<EditReservationEvent, EditReservationState> {
  EditReservationBloc() : super(EditReservationInitial()) {
    on<EditReservationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
