import 'package:flutter/material.dart';

import '../core/extensions/color_ext.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.isObscure = false,
    required this.hint,
    this.minLines = 1,
    this.maxLines = 1,
    required this.validation,
  });
  final TextEditingController controller;
  final bool isObscure;
  final String hint;
  final int? minLines;
  final int? maxLines;
  final Function(String value) validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        style: const TextStyle(color: C.text1),
        validator: (value) => validation(value ?? ''),
        controller: controller,
        obscureText: isObscure,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: C.bg,
          hintText: hint,
          hintStyle: const TextStyle(
              color: C.text2, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
