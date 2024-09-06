import 'package:flutter/material.dart';
import 'package:project6/colors/app_colors.dart';

class LoginButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onLogin;
  const LoginButtonWidget({super.key, required this.title, this.onLogin});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll<Color>(ColorSelect.brandColor),
              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
          onPressed: onLogin,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          )),
    );
  }
}
