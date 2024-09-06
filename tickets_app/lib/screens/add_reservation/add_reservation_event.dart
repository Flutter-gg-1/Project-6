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

class ConfirmBookingEvent extends AddReservationEvent {
  final Room room;
  final int userId;
  final DateTime date;
  final int numNights;

  ConfirmBookingEvent({
    required this.room,
    required this.userId,
    required this.date,
    required this.numNights,
  });
}
