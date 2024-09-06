import 'package:flutter/material.dart';
import 'package:project_6/colors/app_colors.dart';
import 'package:project_6/helper/nav.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, required this.toScreen});

  final String title;
  final Widget toScreen;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorSelect.brandColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
          onPressed: () {
            context.push(screen: toScreen);
          },
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}
