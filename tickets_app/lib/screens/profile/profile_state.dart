part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class RemoveResState extends ProfileState {
  final int reservationId;

  RemoveResState({required this.reservationId});
}

final class SignOutState extends ProfileState {}

final class UpdateResListState extends ProfileState {
  final List<Reservation> reservations;

  UpdateResListState({required this.reservations});
}
