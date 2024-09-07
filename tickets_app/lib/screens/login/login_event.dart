part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginAttemptEvent extends LoginEvent {
  final String email;
  final String password;
  LoginAttemptEvent({required this.email, required this.password});
}
