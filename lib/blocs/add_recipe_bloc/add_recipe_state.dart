part of 'add_recipe_bloc.dart';

@immutable
sealed class AddRecipeState {}

final class AddRecipeInitial extends AddRecipeState {}

final class SuccessfullAddState extends AddRecipeState {
  final XFile image;
  final String recipeName;
  final String recipeDescription;

  SuccessfullAddState(
      {required this.image,
      required this.recipeName,
      required this.recipeDescription});
}

final class SuccessfullEditState extends AddRecipeState {
  final XFile image;
  final String recipeName;
  final String recipeDescription;

  SuccessfullEditState(
      {required this.image,
      required this.recipeName,
      required this.recipeDescription});
}

final class FailedAddState extends AddRecipeState {
  final String message;
  FailedAddState({required this.message});
}

final class ImageUploadState extends AddRecipeState {
  final XFile image;

    ImageUploadState({required this.image});
}

final class ErrorState extends AddRecipeState {}
