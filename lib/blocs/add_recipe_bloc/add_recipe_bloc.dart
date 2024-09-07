import 'dart:async';
import 'dart:developer';
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
     on<SaveRecipeEvent>(saveRecipeMethod);
      on<UploadImageEvent>(uploadImageMethod);
      on<SaveEditEvent>(saveEditMethod);
  }

  FutureOr<void> saveRecipeMethod(
      SaveRecipeEvent event, Emitter<AddRecipeState> emit) async{
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

  FutureOr<void> uploadImageMethod(
      UploadImageEvent event, Emitter<AddRecipeState> emit) {
    selectedImage = event.image;
    emit(ImageUploadState(image: selectedImage!));
  }

  FutureOr<void> saveEditMethod(SaveEditEvent event, Emitter<AddRecipeState> emit) {
     if (event.image != null &&
        event.recipeName.isNotEmpty &&
        event.recipeDescription.isNotEmpty) {
          log('edited');
      emit(SuccessfullEditState(
        image: event.image!,
        recipeName: event.recipeName,
        recipeDescription: event.recipeDescription,
      ));
    } else {
      emit(FailedAddState(
          message: 'Please fill in all fields and select an image'));
    }
  }
}
