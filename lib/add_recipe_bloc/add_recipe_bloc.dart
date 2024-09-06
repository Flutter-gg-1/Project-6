import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

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
    });
  }

  FutureOr<void> saveRecipeMethod(
      SaveRecipeEvent event, Emitter<AddRecipeState> emit) {
    if (selectedImage != null &&
        recipeNameController.text.isNotEmpty &&
        recipeDescriptionController.text.isNotEmpty) {
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
}
