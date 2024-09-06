import 'package:flutter/material.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/screens/log_in_screen.dart';
import 'package:project6/screens/sign_up_screen.dart';
import 'package:project6/widgets/button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
            Image.asset("assets/logo.png", width: 350),
            ButtonWidget(title: "Log in",onPressed: () => context.pushReplacement(screen: const LogInScreen())),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 110),
                const Text("Don't have an account ? ",style: TextStyle(color: Colors.white)),
                InkWell(
                  onTap: () => context.push(screen: const SignUpScreen()),
                  child: const Text("Sign Up",style: TextStyle(color: ColorSelect.brandColor))
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}