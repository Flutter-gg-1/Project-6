part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class RemoveResEvent extends ProfileEvent {}

final class SignOutEvent extends ProfileEvent {}
