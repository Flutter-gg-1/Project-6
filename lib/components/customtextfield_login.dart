import 'package:flutter/material.dart';

class CustomTextField_login extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool showPassword;
  final VoidCallback? togglePasswordView;
  final String? Function(String?)? validator;
// 
  const CustomTextField_login({
    required this.title,
    required this.hintText,
    required this.controller,
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
                onPressed: togglePasswordView,
              )
            : null,
      ),
      validator: validator,
    );
  }
}
