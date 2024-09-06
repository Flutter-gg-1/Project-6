import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:project6/data_layer/recipe_data.dart';
import 'package:project6/services/setup.dart';

import '../models/recipe.dart';

part 'add_recipe_event.dart';
part 'add_recipe_state.dart';

class AddRecipeBloc extends Bloc<AddRecipeEvent, AddRecipeState> {
  final TextEditingController recipeNameController = TextEditingController();
  final TextEditingController recipeDescriptionController =
      TextEditingController();
  XFile? selectedImage;

  AddRecipeBloc() : super(AddRecipeInitial()) {
    on<AddRecipeEvent>((event, emit) {
      on<SaveRecipeEvent>(saveRecipeMethod);
      on<UploadImageEvent>(uploadImageMethod);
    });
  }

  FutureOr<void> saveRecipeMethod(
      SaveRecipeEvent event, Emitter<AddRecipeState> emit) {
    if (selectedImage != null &&
        recipeNameController.text.isNotEmpty &&
        recipeDescriptionController.text.isNotEmpty) {
      locator.get<RecipeData>().addRecipe(Recipe.fromJson({
            'image': selectedImage,
            'recipeTitle': recipeNameController.text,
            'recipeDescription': recipeDescriptionController.text,
          }));
      emit(SuccessfullAddState(
        image: selectedImage!,
        recipeName: recipeNameController.text,
        recipeDescription: recipeDescriptionController.text,
      ));
    } else {
      emit(FailedAddState(
          message: 'Please fill in all fields and select an image'));
    }
  }

  FutureOr<void> uploadImageMethod(
      UploadImageEvent event, Emitter<AddRecipeState> emit) {
    selectedImage = event.image;
    emit(ImageUploadState(image: selectedImage!));
  }
}
