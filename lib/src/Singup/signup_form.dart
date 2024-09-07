import 'package:flutter/material.dart';
import 'package:project6/data_layer/recipe_data.dart';
import 'package:project6/models/user.dart';
import 'package:project6/services/setup.dart';
import 'package:project6/src/Login/login.dart';
import 'package:project6/theme/app_colors.dart';

import '../Login/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Container(
      width: 337,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(.8),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // Shadow color with opacity
            blurRadius: 10, // How much to blur the shadow
            spreadRadius: 2, // How far the shadow spreads
            offset: const Offset(4, 4), // Offset of the shadow (x, y)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Username',
            style: TextStyle(color: AppColors.lighthread, fontSize: 19),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'Enter your username',
            controller: usernameController,
          ),
          const SizedBox(height: 16),
          const Text(
            'Email',
            style: TextStyle(color: AppColors.lighthread, fontSize: 19),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'Enter your email',
            controller: emailController,
          ),
          const SizedBox(height: 16),
          const Text(
            'Password',
            style: TextStyle(color: AppColors.lighthread, fontSize: 19),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: 'Enter your password',
            obscureText: true,
            controller: passwordController,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lighthread,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 60,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (usernameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  locator.get<RecipeData>().registerNewUser(User.fromJson({
                        'username': usernameController.text,
                        'password': passwordController.text,
                        'email': emailController.text,
                      }));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login()));
                }
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
