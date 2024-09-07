import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool showPassword;
  final Function? togglePasswordView;
  final String? Function(String?)? validator;

  const CustomTextField({
    required this.title,
    required this.controller,
    this.hintText = '',
    this.isPassword = false,
    this.showPassword = false,
    this.togglePasswordView,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && !showPassword,
      decoration: InputDecoration(
        labelText: title,
        hintText: hintText,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  if (togglePasswordView != null) {
                    togglePasswordView!();
                  }
                },
              )
            : null,
      ),
      validator: validator,
    );
  }
}
