import 'package:flutter/material.dart';
import 'package:project_6/Screens/log_in_screen.dart';
import 'package:project_6/Screens/sign_up_screen.dart';
import 'package:project_6/Widget/button_widget.dart';
import 'package:project_6/colors/app_colors.dart';
import 'package:project_6/helper/nav.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.backgroundColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Image.asset(
              "assets/logo.png",
              width: 300,
            ),
            const SizedBox(
              height: 120,
            ),
            const ButtonWidget(
              title: "Log in",
              toScreen: LogInScreen(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Don’t have an account",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                      onTap: () {
                        context.push(screen: const SignUpScreen());
                      },
                      child: Text(
                        " Sign Up",
                        style: TextStyle(color: ColorSelect.brandColor),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
