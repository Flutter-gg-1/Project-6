import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project6/data/users_layer.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/screens/movies_screen.dart';
import 'package:project6/screens/sign_up_screen.dart';
import 'package:project6/widgets/fields/text_field_widget.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/widgets/login_button_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final usersLayer = GetIt.I.get<UsersLayer>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.backgroundColor,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style: GoogleFonts.mulish(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(height: 50),
              TextFieldWiedget(
                controllerof: emailController,
                text: "Email",
                prefixIcon: const Icon(Icons.email_outlined),
                validator: (emailController) {
                  if (!emailController!.contains("@")) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              TextFieldWiedget(
                controllerof: passwordController,
                text: "Password",
                prefixIcon: const Icon(Icons.key),
                validator: (passwordController) {
                  if (passwordController!.trim().isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 150),
              LoginButtonWidget(
                title: "Login",
                onLogin: () {
                  if (_formKey.currentState!.validate()) {
                    for (var user in usersLayer.users) {
                      if (emailController.text == user.email && passwordController.text == user.password) {
                        usersLayer.login(user: user);
                        context.pushRemoveUntil(screen: const MoviesScreen());
                        return;
                      }
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Incorrect email or password')),
                    );
                  log((usersLayer.currentUser?.name).toString());
                  }
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 110),
                  const Text("Don't have an account ?",style: TextStyle(color: Colors.white)),
                  InkWell(
                    onTap: () => context.pushReplacement(screen: const SignUpScreen()),
                    child: const Text(" Sign Up",style: TextStyle(color: ColorSelect.brandColor))
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}