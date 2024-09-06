part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadDataState extends HomeState {}

final class SuccessfulLoadState extends HomeState {}

final class SuccessfulEditState extends HomeState {}

final class RemoveState extends HomeState {}

final class ErrorState extends HomeState {}