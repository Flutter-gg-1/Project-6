import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project6/blocs/add_recipe_bloc/add_recipe_bloc.dart';
import 'package:project6/blocs/home_bloc/home_bloc.dart';

class EditRecipePage extends StatefulWidget {
  final String initialRecipeTitle;
  final String initialDescription;
  final File imageFile;

  const EditRecipePage({
    super.key,
    required this.initialRecipeTitle,
    required this.initialDescription,
    required this.imageFile,
  });

  @override
  _EditRecipePageState createState() => _EditRecipePageState();
}

class _EditRecipePageState extends State<EditRecipePage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialRecipeTitle);
    _descriptionController =
        TextEditingController(text: widget.initialDescription);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRecipeBloc(),
      child: Builder(builder: (context) {
        return BlocListener<AddRecipeBloc, AddRecipeState>(
          listener: (context, state) {
            if (state is SuccessfullEditState) {
              Navigator.pop(context, {
                'image': state.image,
                'recipeTitle': state.recipeName,
                'recipeDescription': state.recipeDescription,
              });
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Edit Recipe"),
              backgroundColor: const Color(0xff7baaff),
              actions: [
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    context.read<AddRecipeBloc>().add(SaveEditEvent(image:XFile( widget.imageFile.path), recipeName: _titleController.text, recipeDescription: _descriptionController.text));
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.file(
                      widget.imageFile,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Meal Name',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the meal name',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Recipe Description',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the recipe description',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

