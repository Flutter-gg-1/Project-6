import 'package:flutter/material.dart';
import 'package:project_6/colors/app_colors.dart';

class TextFieldWiedget extends StatefulWidget {
  const TextFieldWiedget({super.key, required this.text, this.controllerof});

  final String text;
  final TextEditingController? controllerof;

  @override
  State<TextFieldWiedget> createState() => _TextFieldWiedgetState();
}

class _TextFieldWiedgetState extends State<TextFieldWiedget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 45,
      child: TextFormField(
        controller: widget.controllerof,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorSelect.cardsColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: widget.text,
          hintStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          focusedBorder: OutlineInputBorder(
            // Border when the field is focused
            borderSide: BorderSide(color: ColorSelect.brandColor, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
