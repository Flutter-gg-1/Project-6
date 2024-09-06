part of 'recipe_bloc.dart';

@immutable
sealed class RecipeEvent {}

final class LoadDataEvent extends RecipeEvent {}

final class LoadNewRecipeEvent extends RecipeEvent {}

final class EditRecipeEvent extends RecipeEvent {}

final class RemoveRecipeEvent extends RecipeEvent {}