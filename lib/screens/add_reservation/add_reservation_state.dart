part of 'add_reservation_bloc.dart';

@immutable
sealed class AddReservationState {}

final class AddReservationInitial extends AddReservationState {}

final class UpdateDateState extends AddReservationState {
  final String dateStr;

  UpdateDateState({required this.dateStr});
}

final class UpdateNightsState extends AddReservationState {
  final int nights;
  final int totalPrice;
  UpdateNightsState({
    required this.nights,
    required this.totalPrice,
  });
}

final class ConfirmBookingState extends AddReservationState {
  final String title;
  final String msg;
  ConfirmBookingState({required this.title, required this.msg});
}

final class BookingErrorState extends AddReservationState {
  final String title;
  final String msg;
  BookingErrorState({required this.title, required this.msg});
}

final class UpdateBtnTitleState extends AddReservationState {
  final String title;
  UpdateBtnTitleState({required this.title});
}
