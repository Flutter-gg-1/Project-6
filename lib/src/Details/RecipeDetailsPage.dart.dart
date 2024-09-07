import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/blocs/home_bloc/home_bloc.dart';
import 'package:project6/data_layer/recipe_data.dart';
import 'package:project6/services/setup.dart';
import 'package:project6/src/Details/bloc/recp_bloc.dart';
import 'package:project6/src/Details/bloc/recp_event.dart';
import 'package:project6/src/Details/bloc/recp_state.dart';
import 'package:project6/theme/app_colors.dart';
import 'dart:io';

class RecipeDetailsPage extends StatelessWidget {
  final String recipeTitle;
  final File imageFile;
  final String description;
  final HomeBloc homeBloc;

  const RecipeDetailsPage({
    super.key,
    required this.recipeTitle,
    required this.imageFile,
    required this.description,
    required this.homeBloc,
  });

  void _showEditBottomSheet(
      BuildContext context, RecpBloc bloc, HomeBloc homeBloc) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        String updatedTitle = recipeTitle;
        String updatedDescription = description;

        return FractionallySizedBox(
          heightFactor: 0.7,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, top: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Meal Name',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    controller: TextEditingController(text: updatedTitle),
                    onChanged: (value) {
                      updatedTitle = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    controller: TextEditingController(text: updatedDescription),
                    onChanged: (value) {
                      updatedDescription = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lighthread, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size.fromHeight(50), 
                    ),
                    onPressed: () {
                      bloc.add(UpdateRecipeEvent(
                        updatedTitle,
                        updatedDescription,
                      ));

                      homeBloc.add(UpdateRecipeInHomeEvent(
                        updatedTitle,
                        updatedDescription,
                        locator
                            .get<RecipeData>()
                            .recipes
                            .firstWhere((e) => e.recipeName == recipeTitle),
                      ));

                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
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
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => RecpBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<RecpBloc>();

        return Scaffold(
          appBar: AppBar(
            title: Text(
              recipeTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            backgroundColor: AppColors.lighthread,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _showEditBottomSheet(context, bloc, homeBloc);
                },
              ),
            ],
          ),
          body: BlocConsumer<RecpBloc, RecpState>(
            listener: (context, state) {
              if (state is RecipeUpdatedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Recipe updated: ${state.title}')),
                );
              }
            },
            builder: (context, state) {
              String currentTitle = recipeTitle;
              String currentDescription = description;

              if (state is RecipeUpdatedState) {
                currentTitle = state.title;
                currentDescription = state.description;
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.file(
                          imageFile,
                          width: double.infinity,
                          height: screenSize.height * 0.4,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: screenSize.height * 0.4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Meal',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkread,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            currentTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Recipe',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkread,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            currentDescription,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
