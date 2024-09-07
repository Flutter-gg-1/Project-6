import 'dart:io';

class Recipe {
  final File image;
  String recipeName;
  String description;
  String author = '';
  Recipe({
    required this.image,
    required this.recipeName,
    required this.description,
  });

  factory Recipe.fromJson(Map json) {
    return Recipe(
      image: File(json['image']),
      recipeName: json['recipeTitle'],
      description: json['recipeDescription'],
    );
  }

  toJson() {
    return {
      'image': image.path,
      'recipeTitle': recipeName,
      'recipeDescription': description,
    };
  }
}
