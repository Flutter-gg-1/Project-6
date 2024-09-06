part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class LoadDataEvent extends HomeEvent {}

final class LoadNewRecipeEvent extends HomeEvent {}

// final class EditRecipeEvent extends HomeEvent {}

final class RemoveRecipeEvent extends HomeEvent {}