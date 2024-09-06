import 'package:flutter/material.dart';
import 'package:project6/colors/app_colors.dart';

class TextFieldWiedget extends StatelessWidget {
  final String text;
  final Icon? prefixIcon;
  final TextEditingController? controllerof;
  final String? Function(String?)? validator;

  const TextFieldWiedget(
      {super.key,
      required this.text,
      this.controllerof,
      this.prefixIcon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 45,
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUnfocus,
          onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
          controller: controllerof,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.white,
            filled: true,
            fillColor: ColorSelect.cardsColor,
            hintText: text,
            hintStyle: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              // Border when the field is focused
              borderSide: BorderSide(color: ColorSelect.brandColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: validator),
    );
  }
}
