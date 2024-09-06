import 'package:flutter/material.dart';
import 'package:project6/widgets/fields/text_field_widget.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/screens/home_screen.dart';
import 'package:project6/widgets/button_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: ColorSelect.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/logo.png', width: 350,),
            // SizedBox(height: 100),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 50),
            TextFieldWiedget(text: "Email", prefixIcon: Icon(Icons.email_outlined,),),
            SizedBox(height: 24),
            TextFieldWiedget(text: "Password", prefixIcon: Icon(Icons.key),),
            SizedBox(height: 150),
            ButtonWidget(title: "Login", toScreen: HomeScreen())
          ],
        ),
      ),
    );
  }
}