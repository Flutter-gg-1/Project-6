import 'dart:io';
import 'review.dart';

class Recipe {
  final File image;
   String recipeName;
   String description;
  List<Review>? reviews;

  Recipe(
      {required this.image,
      required this.recipeName,
      required this.description,
      this.reviews = const []});

  factory Recipe.fromJson(Map json) {
    return Recipe(
        image: File(json['image']),
        recipeName: json['recipeTitle'],
        description: json['recipeDescription'],
        reviews: json['reviews'] != null
            ? (json['reviews'] as List)
                .map((comment) => Review.fromJson(comment))
                .toList()
            : []);
  }

  toJson() {
    return {
      'image': image.path,
      'recipeTitle': recipeName,
      'recipeDescription': description,
      'reviews': reviews?.map((review) => review.toJson()).toList() ?? [],
    };
  }
}
