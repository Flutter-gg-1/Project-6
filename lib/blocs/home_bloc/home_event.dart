part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class LoadDataEvent extends HomeEvent {}

final class LoadNewRecipeEvent extends HomeEvent {}

final class EditRecipeEvent extends HomeEvent {
  final Recipe oldRecipe;
  final Recipe newRecipe;

  EditRecipeEvent({required this.oldRecipe, required this.newRecipe});
}

final class RemoveRecipeEvent extends HomeEvent {}

final class UpdateRecipeInHomeEvent extends HomeEvent {
  final String recipeTitle;
  final String recipeDescription;
  Recipe recipe;
  UpdateRecipeInHomeEvent(this.recipeTitle, this.recipeDescription, this.recipe);
}
