import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom(
      {super.key,
      required this.title,
      required this.color,
      required this.weight,
      required this.size});
  final String title;
  final Color color;
  final FontWeight weight;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: weight, fontSize: size, color: color),
    );
  }
}
