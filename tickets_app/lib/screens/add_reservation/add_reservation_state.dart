part of 'add_reservation_bloc.dart';

@immutable
sealed class AddReservationState {}

final class AddReservationInitial extends AddReservationState {}

final class UpdateNightsState extends AddReservationState {
  final int nights;
  final int totalPrice;
  UpdateNightsState({
    required this.nights,
    required this.totalPrice,
  });
}

final class ConfirmBookingState extends AddReservationState {
  ConfirmBookingState();
}

final class BookingErrorState extends AddReservationState {
  final String msg;
  BookingErrorState({required this.msg});
}
