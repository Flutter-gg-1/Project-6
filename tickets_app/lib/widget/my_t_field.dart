import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, this.hintText, this.prefixIcon});
  final String? hintText;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          filled: true,
          fillColor: C.lithGray,
          hintText: hintText,
        ),
      ),
    );
  }
}
