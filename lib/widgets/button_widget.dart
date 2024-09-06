import 'package:flutter/material.dart';
import 'package:project6/colors/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final double? fontSize;
  const ButtonWidget({super.key, required this.title, this.onPressed, this.color, this.width, this.height, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 324,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:  WidgetStatePropertyAll<Color>(color ?? ColorSelect.brandColor),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: fontSize ?? 20, fontWeight: FontWeight.w400),
        )
      ),
    );
  }
}
