part of 'add_reservation_bloc.dart';

@immutable
sealed class AddReservationEvent {}

class LoadEvent extends AddReservationEvent {}

class SelectNightsEvent extends AddReservationEvent {
  final int roomPrice;
  final int numNights;
  SelectNightsEvent({required this.roomPrice, required this.numNights});
}

class SelectDateEvent extends AddReservationEvent {
  final DateTime date;
  SelectDateEvent({required this.date});
}

class UpdateReservationEvent extends AddReservationEvent {
  final Reservation? reservation;
  UpdateReservationEvent({this.reservation});
}

class ConfirmBookingEvent extends AddReservationEvent {
  final int roomId;

  ConfirmBookingEvent({
    required this.roomId,
  });
}
