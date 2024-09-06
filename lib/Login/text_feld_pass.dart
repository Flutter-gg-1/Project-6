import 'package:flutter/material.dart';
import 'package:project6/theme/app_colors.dart';

class CustomTextFieldPassword extends StatelessWidget {
  final String hintText;

  final TextEditingController controller;

  const CustomTextFieldPassword({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4, // Controls the shadow intensity
      shadowColor: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
          obscureText: true,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
          validator: (value) {
            if (controller.text.isEmpty) {
              return 'Kindly Enter your User Passwoed';
            }
            return null;
          },
          style: const TextStyle(color: AppColors.darkread)),
    );
  }
}
