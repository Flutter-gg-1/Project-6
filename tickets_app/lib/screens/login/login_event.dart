part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class EventAfterWritingLogin extends LoginEvent {
  final String name;
  EventAfterWritingLogin({required this.name});
}
