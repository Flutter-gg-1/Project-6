import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title; 
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool showPassword;
  final VoidCallback? togglePasswordView;

  const CustomTextField({super.key, 
    required this.title, 
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.showPassword = false,
    this.togglePasswordView,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title, 
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
               color: Color(0xFFB98875),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 4), 
                blurRadius: 10,
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword && !showPassword,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              fillColor: Colors.white,
              filled: true,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xFFB98875), 
                      ),
                      onPressed: togglePasswordView,
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  color: Color(0xFFB98875), 
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  color: Color(0xFFB98875), 
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(
                  color: Color(0xFFB98875), 
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
