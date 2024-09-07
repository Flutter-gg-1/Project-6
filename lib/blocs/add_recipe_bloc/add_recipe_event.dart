part of 'add_recipe_bloc.dart';

@immutable
sealed class AddRecipeEvent {}

final class SaveRecipeEvent extends AddRecipeEvent {}

final class SaveEditEvent extends AddRecipeEvent {
   final XFile? image;
  final String recipeName;
  final String recipeDescription;

  SaveEditEvent(
      {required this.image,
      required this.recipeName,
      required this.recipeDescription});
}

final class UploadImageEvent extends AddRecipeEvent {
  final XFile image;
  UploadImageEvent({required this.image});
}