import 'package:flutter/material.dart';
import 'package:project6/theme/app_colors.dart';

class CustomTextFieldUsername extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFieldUsername({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4, // Controls the shadow intensity
      shadowColor: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        obscureText: obscureText,
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
            return 'Kindly Enter your Password';
          }
          return null;
        },
        style: const TextStyle(color: AppColors.darkread),
      ),
    );
  }
}
