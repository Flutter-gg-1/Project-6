part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpAttemptEvent extends SignUpEvent {
  SignUpAttemptEvent();
}
