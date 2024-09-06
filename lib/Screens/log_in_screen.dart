import 'package:flutter/material.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/screens/movies_screen.dart';
import 'package:project6/widgets/fields/text_field_widget.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/widgets/button_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/logo.png', width: 350,),
            // SizedBox(height: 100),
            const Text(
              "Welcome Back",
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const TextFieldWiedget(
              text: "Email",
              prefixIcon: Icon(
                Icons.email_outlined,
              ),
            ),
            const SizedBox(height: 24),
            const TextFieldWiedget(
              text: "Password",
              prefixIcon: Icon(Icons.key),
            ),
            const SizedBox(height: 150),
            ButtonWidget(
                title: "Login",
                onPressed: () => context.push(screen: const MoviesScreen()))
          ],
        ),
      ),
    );
  }
}
