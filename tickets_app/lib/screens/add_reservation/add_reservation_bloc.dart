import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tickets_app/managers/reservation_mgr.dart';
import 'package:tickets_app/managers/user_mgr.dart';
import 'package:tickets_app/model/reservation.dart';

import '../../model/room.dart';

part 'add_reservation_event.dart';
part 'add_reservation_state.dart';

class AddReservationBloc
    extends Bloc<AddReservationEvent, AddReservationState> {
  final userMgr = GetIt.I.get<UserMgr>();
  final reservationMgr = GetIt.I.get<ReservationMgr>();
  final int initialNightsValue = 1;

  AddReservationBloc() : super(AddReservationInitial()) {
    on<AddReservationEvent>((event, emit) {});

    on<SelectNightsEvent>(updateNights);

    on<ConfirmBookingEvent>(confirmBooking);
  }

  FutureOr<void> updateNights(
      SelectNightsEvent event, Emitter<AddReservationState> emit) {
    var total = event.numNights * event.roomPrice;
    emit(UpdateNightsState(nights: event.numNights, totalPrice: total));
  }

  FutureOr<void> confirmBooking(
      ConfirmBookingEvent event, Emitter<AddReservationState> emit) {
    var strDate = event.date.toString();
    var reservation = Reservation(
        id: Random().nextInt(999),
        userId: 0, // currentUser.id
        roomId: event.room.id,
        date: strDate,
        numNights: event.numNights);
    try {
      reservationMgr.addReservation(reservation);
      emit(ConfirmBookingState());
    } catch (e) {
      emit(BookingErrorState(msg: '$e\n Error Creating Booking'));
    }
  }
}
