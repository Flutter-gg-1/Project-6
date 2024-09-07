part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class RemoveResEvent extends ProfileEvent {
  final int reservationId;

  RemoveResEvent({required this.reservationId});
}

final class SignOutEvent extends ProfileEvent {}
