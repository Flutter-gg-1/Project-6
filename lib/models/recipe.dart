import 'dart:io';
import 'review.dart';

class Recipe {
  final File image;
  final String recipeName;
  final String description;
  final List<Review>? reviews;

  Recipe({required this.image,required this.recipeName, required this.description, this.reviews});

  factory Recipe.fromJson(Map json) {
    return Recipe(
      image: File(json['image']),
        recipeName: json['recipeTitle'],
        description: json['recipeDescription'],
        reviews: (json['reviews'] as List)
            .map((comment) => Review.fromJson(comment))
            .toList()) ;
  }

  toJson() {
    return {
      'image_path': image.path,
      'recipe_name': recipeName,
      'description': description,
      'reviews': reviews?.map((review) => review.toJson()).toList(),
    };
  }
}
