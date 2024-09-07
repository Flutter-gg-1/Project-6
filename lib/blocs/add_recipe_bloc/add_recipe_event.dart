part of 'add_recipe_bloc.dart';

@immutable
sealed class AddRecipeEvent {}

final class SaveRecipeEvent extends AddRecipeEvent {}

final class UploadImageEvent extends AddRecipeEvent {
  final XFile image;
  UploadImageEvent({required this.image});
}