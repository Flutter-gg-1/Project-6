import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project6/data/users_layer.dart';
import 'package:project6/screens/movies_screen.dart';
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
              TextFieldWiedget(
                controllerof: emailController,
                text: "Email",
                prefixIcon: const Icon(
                  Icons.email_outlined,
                ),
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
                      bool userFound = false;

                      for (var user in usersLayer.users) {
                        if (emailController.text == user.email &&
                            passwordController.text == user.password) {
                          userFound = true;
                          usersLayer.currentUser = user;
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return const MoviesScreen();
                            }),
                          );
                          break;
                        }
                      }

                      if (!userFound) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Incorrect email or password'),
                          ),
                        );
                      }
                    }
                    log(usersLayer.users.last.name);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
