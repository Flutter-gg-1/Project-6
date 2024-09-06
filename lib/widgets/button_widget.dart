import 'package:flutter/material.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/extensions/nav.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const ButtonWidget({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  const WidgetStatePropertyAll<Color>(ColorSelect.brandColor),
              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
          onPressed: onPressed
          //  toScreen != null
          //     ? () {
          //         context.push(screen: toScreen!);
          //       }
          //     : null,
          ,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          )),
    );
  }
}
