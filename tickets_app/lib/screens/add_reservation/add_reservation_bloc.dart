import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tickets_app/core/extensions/date_ext.dart';
import 'package:tickets_app/managers/reservation_mgr.dart';
import 'package:tickets_app/managers/user_mgr.dart';
import 'package:tickets_app/model/reservation.dart';
import '../../managers/room_mgr.dart';

part 'add_reservation_event.dart';
part 'add_reservation_state.dart';

class AddReservationBloc
    extends Bloc<AddReservationEvent, AddReservationState> {
  final userMgr = GetIt.I.get<UserMgr>();
  final roomMgr = GetIt.I.get<RoomMgr>();
  final reservationMgr = GetIt.I.get<ReservationMgr>();
  int numNights = 1;
  String date = DateTime.now().toFormattedString();
  int totalPrice = 0;
  Reservation? oldRes;

  AddReservationBloc() : super(AddReservationInitial()) {
    on<AddReservationEvent>((event, emit) {});

    on<UpdateReservationEvent>(updateReservation);

    on<SelectDateEvent>(updateDate);

    on<SelectNightsEvent>(updateNights);

    on<ConfirmBookingEvent>(confirmBooking);
  }

  // For updating existing reservations

  FutureOr<void> updateReservation(
      UpdateReservationEvent event, Emitter<AddReservationState> emit) {
    print('This state was called!');
    oldRes = event.reservation;
    numNights = oldRes!.numNights;
    date = oldRes!.date;
    var room =
        roomMgr.allRooms.where((room) => room.id == oldRes!.roomId).first;
    totalPrice = numNights * room.price;
    emit(UpdateDateState(dateStr: date));
    emit(UpdateNightsState(nights: numNights, totalPrice: totalPrice));
    emit(UpdateBtnTitleState(title: 'Update Booking'));
  }

  FutureOr<void> updateDate(
      SelectDateEvent event, Emitter<AddReservationState> emit) {
    date = event.date.toFormattedString();

    emit(UpdateDateState(dateStr: date));
  }

  FutureOr<void> updateNights(
      SelectNightsEvent event, Emitter<AddReservationState> emit) {
    numNights = event.numNights;
    totalPrice = numNights * event.roomPrice;
    emit(UpdateNightsState(nights: numNights, totalPrice: totalPrice));
  }

  FutureOr<void> confirmBooking(
      ConfirmBookingEvent event, Emitter<AddReservationState> emit) {
    var reservation = Reservation(
        id: (oldRes == null) ? Random().nextInt(999) : oldRes!.id,
        userId: userMgr.currentUser?.id ?? 0, // currentUser.id
        roomId: event.roomId,
        date: date,
        numNights: numNights);
    try {
      (oldRes == null)
          ? reservationMgr.addReservation(reservation)
          : reservationMgr.updateReservation(reservation);
      emit(
        ConfirmBookingState(
          title: (oldRes == null)
              ? 'Booking Created Successfully!'
              : 'Booking Updated Successfully!',
          msg: 'You can find all your bookings in your profile',
        ),
      );
    } catch (e) {
      emit(BookingErrorState(
          title: 'Oops!', msg: '$e\n Error Creating Booking'));
    }
  }
}
