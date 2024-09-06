import 'package:flutter/material.dart';
import 'package:project_6/Screens/home_screen.dart';
import 'package:project_6/Screens/log_in_screen.dart';
import 'package:project_6/Widget/button_widget.dart';
import 'package:project_6/Widget/text_field_widget.dart';
import 'package:project_6/colors/app_colors.dart';
import 'package:project_6/helper/nav.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? paswoordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Get Started",
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
           TextFieldWiedget(text: "Name",controllerof: nameController!,)
          ,  const SizedBox(
              height: 10,
            ),
             TextFieldWiedget(
              controllerof: emailController!,
              text: "Email",
            ),
            const SizedBox(
              height: 10,
            ),
             TextFieldWiedget(
              controllerof: phoneController!,
              text: "Phone",
            ),
            const SizedBox(
              height: 10,
            ),
             TextFieldWiedget(
              controllerof: paswoordController!,
              text: "Password",
            ),
            const SizedBox(
              height: 150,
            ),
            const ButtonWidget(title: "Next", toScreen: HomeScreen()),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Already a member?",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                      onTap: () {
                        context.push(screen: const LogInScreen());
                      },
                      child: Text(
                        " Log in",
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
