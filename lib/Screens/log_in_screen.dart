import 'package:flutter/material.dart';
import 'package:project_6/Screens/home_screen.dart';
import 'package:project_6/Widget/button_widget.dart';
import 'package:project_6/Widget/text_field_widget.dart';
import 'package:project_6/colors/app_colors.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.backgroundColor,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Welcom Back",
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            TextFieldWiedget(text: "Name"),
            SizedBox(
              height: 24,
            ),
            TextFieldWiedget(text: "Password"),
            SizedBox(
              height: 150,
            ),
            ButtonWidget(title: "Next", toScreen: HomeScreen())
          ],
        ),
      ),
    );
  }
}
