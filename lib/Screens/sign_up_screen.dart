import 'package:flutter/material.dart';
import 'package:project6/screens/movies_screen.dart';
import 'package:project6/widgets/fields/text_field_widget.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/screens/log_in_screen.dart';
import 'package:project6/widgets/button_widget.dart';

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
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Get Started",
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            TextFieldWiedget(
              text: "Name",
              controllerof: nameController!,
              prefixIcon: const Icon(Icons.person_outlined),
            ),
            const SizedBox(height: 20),
            TextFieldWiedget(
              controllerof: emailController!,
              text: "Email",
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 20),
            TextFieldWiedget(
              controllerof: phoneController!,
              text: "Phone",
              prefixIcon: const Icon(Icons.phone),
            ),
            const SizedBox(height: 20),
            TextFieldWiedget(
              controllerof: paswoordController!,
              text: "Password",
              prefixIcon: const Icon(Icons.key),
            ),
            const SizedBox(height: 150),
            ButtonWidget(
                title: "Sign Up",
                onPressed: () => context.push(screen: const MoviesScreen())),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 110),
                const Text("Already have an account ? ",
                    style: TextStyle(color: Colors.white)),
                InkWell(
                    onTap: () => context.push(screen: const LogInScreen()),
                    child: const Text("Login",
                        style: TextStyle(color: ColorSelect.brandColor)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
