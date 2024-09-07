part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class SuccessfulState extends LoginState {
  // bool shouldNavigate;
  //
  // SuccessfulState({required this.shouldNavigate});
}

final class ErrorState extends LoginState {
  final String msg = '123';
}
