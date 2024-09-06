import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project6/add_recipe_bloc/add_recipe_bloc.dart';

import 'package:project6/theme/app_colors.dart';

class AddRecipePage extends StatelessWidget {
  const AddRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRecipeBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<AddRecipeBloc>();
        return BlocConsumer<AddRecipeBloc, AddRecipeState>(
          listener: (context, state) {
            if (state is SuccessfullAddState) {
              log('popped');
              Navigator.pop(context, {
                'image': state.image,
                'recipeTitle': state.recipeName,
                'recipeDescription': state.recipeDescription,
              });
            } else if (state is FailedAddState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }else{
              log('nothing');
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.primary,
              appBar: AppBar(
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  title: const Text('Add New Recipe',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  backgroundColor: AppColors.lighthread),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image picker section
                      GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedImage != null) {
                            bloc.selectedImage = pickedImage;
                            bloc.add(UploadImageEvent(image: pickedImage));
                          }
                        },
                        child: BlocBuilder<AddRecipeBloc, AddRecipeState>(
                          builder: (context, state) {
                            return Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.lighthread,
                                      AppColors.darkread
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: state is ImageUploadState
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.file(
                                          File(bloc.selectedImage!.path),
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const Center(
                                        child: Icon(
                                          Icons.add_a_photo,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                      ));
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Recipe name input
                      const Text(
                        'Recipe Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: bloc.recipeNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: AppColors.white,
                          hintText: 'Enter the recipe name',
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Recipe description input
                      const Text(
                        'Recipe Description',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: bloc.recipeDescriptionController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: AppColors.white,
                          hintText: 'Enter the recipe description',
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Submit button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            bloc.add(SaveRecipeEvent());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lighthread,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Add Recipe',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  // Method to pick image from gallery
  // Future<void> _pickImage(
  //   XFile _selectedImage,
  // ) async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     // setState to view image
  //     _selectedImage = pickedImage;
  //   }
  // }

  // Method to handle form submission
  // void _submitRecipe(
  //     BuildContext context,
  //     TextEditingController recipeNameController,
  //     TextEditingController recipeDescriptionController,
  //     XFile? selectedImage) {
  //   if (selectedImage != null &&
  //       recipeNameController.text.isNotEmpty &&
  //       recipeDescriptionController.text.isNotEmpty) {
  //     Navigator.pop(context, {
  //       'image': selectedImage,
  //       'recipeTitle': recipeNameController.text,
  //       'recipeDescription': recipeDescriptionController.text,
  //     });
  //   } else {
  //     // Show a message if the user tries to submit an incomplete form
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //           content: Text('Please fill in all fields and select an image')),
  //     );
  //   }
  // }
}
