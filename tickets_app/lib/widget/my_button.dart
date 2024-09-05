import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/get_size.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.bKColor, required this.text, required this.onPressed});
  final Color? bKColor;
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: context.getScreenSize(multiplyWidth: 0.8),
      height: 50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      color: bKColor ?? C.accent,
      onPressed: onPressed,
      child: Text(text).styled(color: C.text1),
    );
  }
}
