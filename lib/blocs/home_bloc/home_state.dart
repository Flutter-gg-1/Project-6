part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadDataState extends HomeState {}

final class SuccessfulLoadState extends HomeState {
  final List<Recipe> recipes;

  SuccessfulLoadState({required this.recipes});
}

final class SuccessfulEditState extends HomeState {}

final class RemoveState extends HomeState {}

final class ErrorState extends HomeState {
  final String message;
  ErrorState({required this.message});
}