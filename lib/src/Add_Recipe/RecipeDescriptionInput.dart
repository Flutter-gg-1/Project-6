import 'package:flutter/material.dart';

class RecipeDescriptionInput extends StatelessWidget {
  final TextEditingController controller;

  const RecipeDescriptionInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recipe Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: 5,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: const Color(0xffEDF6F9),
            hintText: 'Enter the recipe description',
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
