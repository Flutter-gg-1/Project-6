import 'package:flutter/material.dart';

class CustomTextFieldUsername extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextFieldUsername({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xffEDF6F9),
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
          return 'Please enter your $hintText';
        }
        return null;
      },
      style: const TextStyle(color: Color(0xff006D77)),
    );
  }
}
