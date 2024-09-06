import 'package:flutter/material.dart';
import 'package:tickets_app/core/all_file.dart';

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn({
    super.key,
    required this.title,
    this.fontSize = 12,
    required this.callback,
  });
  final String title;
  final double fontSize;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => callback(),
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          minimumSize: WidgetStateProperty.all(Size.zero), // Adjust if needed
          tapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // Shrinks the tap area
        ),
        child: Text(title)
            .styled(color: C.accent, size: fontSize, weight: FontWeight.bold));
  }
}
