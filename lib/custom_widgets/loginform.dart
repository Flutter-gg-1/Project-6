import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:project6/components/custom_button.dart';
import 'package:project6/components/custom_text_field.dart';
import 'package:project6/screens/signup_screen.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool showPassword;
  final VoidCallback onPasswordToggle;
  final VoidCallback onLogin;

  const LoginForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.showPassword,
    required this.onPasswordToggle,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/logo.png'),
            ),
            const ListTile(
              title: Text(
                'Log in',
                style: TextStyle(
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 0.1,
                      color: Colors.black38,
                    ),
                  ],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              title: 'Email',
              hintText: 'Enter your email',
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Password',
              hintText: 'Enter your password',
              controller: passwordController,
              isPassword: true,
              showPassword: showPassword,
              togglePasswordView: onPasswordToggle,
              validator: (value) {
                if (value == null || value.length < 10) {
                  return 'Password must be at least 10 characters';
                }
                return null;
              },
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Login',
              onPressed: onLogin,
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                text: 'Don’t have an account? ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign up',
                    style: const TextStyle(
                      color: Color(0xFFB98875),
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleLogin() {
   print("login");
  }
}
