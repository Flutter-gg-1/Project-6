part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class EventAfterWritingSignUp extends SignUpEvent {
  final String name;
  EventAfterWritingSignUp({required this.name});
}
