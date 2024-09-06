import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project6/Add_Recipe/add_recipe.dart';
import 'package:project6/Home/RecipeCard.dart';
import 'package:project6/Home/custom_rawer.dart';
import 'package:project6/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> recipes = []; // قائمة الوصفات المضافة

  // وظيفة لإضافة وصفة جديدة
  void _addNewRecipe(
      XFile image, String recipeTitle, String recipeDescription) {
    setState(() {
      recipes.add({
        'recipeTitle': recipeTitle,
        'imageUrl': image.path,
        'description': recipeDescription,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final Map<String, dynamic>? newRecipe = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddRecipePage()),
              );
              if (newRecipe != null) {
                _addNewRecipe(
                  newRecipe['image'],
                  newRecipe['recipeTitle'],
                  newRecipe['recipeDescription'],
                );
              }
            },
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColors.lighthread,
        title: Text(
          'Cooking Recipes',
          style: TextStyle(
            fontSize: screenSize.width * 0.08,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const Drawer(child: CustomDrawer()), // قائمة جانبية
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: Container(
                height: screenSize.height * 0.4,
                width: screenSize.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.lighthread,
                      AppColors.darkread,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: recipes.isEmpty
                      ? const Center(
                          child: Text(
                            'No recipes yet. Add some!',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = recipes[index];
                            return RecipeCard(
                              recipeTitle: recipe['recipeTitle'],
                              imageFile: File(recipe['imageUrl']),
                              description: recipe['description'],
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
