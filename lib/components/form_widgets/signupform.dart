import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/components/button_widgets/custom_button.dart';
import 'package:project6/components/text_field_widgets/custom_text_field.dart';
import 'package:project6/data_layer/data/coffee_data.dart';
import 'package:project6/screens/bloc/coffee_bloc.dart';
import 'package:project6/screens/auth_screens/login_screen.dart';
import 'package:project6/setup/init.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final Function showSuccessDialog;

  SignupForm({super.key, required this.showSuccessDialog});

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
                'Sign Up',
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
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Username',
              controller: usernameController,
              hintText: 'Enter your username',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: 'Email',
              controller: emailController,
              hintText: 'Enter your email',
              validator: (value) {
                bool isUsed = getIt
                    .get<CoffeeData>()
                    .accounts
                    .any((account) => account["email"] == value);
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email';
                }
                if (isUsed) {
                  return "Email already taken";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<CoffeeBloc, CoffeeState>(
              builder: (context, state) {
                final showPassword =
                    state is ShowPasswordState ? state.showPassword : false;
                return CustomTextField(
                  title: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  showPassword: showPassword,
                  hintText: 'Enter your password',
                  togglePasswordView: () {
                    BlocProvider.of<CoffeeBloc>(context)
                        .add(TogglePasswordVisibilityEvent());
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 10) {
                      return 'Password must be at least 10 characters';
                    }
                    return null;
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            BlocBuilder<CoffeeBloc, CoffeeState>(
              builder: (context, state) {
                final showConfirmPassword = state is ShowConfirmPasswordState
                    ? state.showConfirmPassword
                    : false;
                return CustomTextField(
                  title: 'Re-enter password',
                  controller: confirmPasswordController,
                  isPassword: true,
                  showPassword: showConfirmPassword,
                  hintText: 'Re-enter your password',
                  togglePasswordView: () {
                    BlocProvider.of<CoffeeBloc>(context)
                        .add(ToggleConfirmPasswordVisibilityEvent());
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Sign Up',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  Map<String, dynamic> account = {
                    "name": usernameController.text,
                    "password": passwordController.text,
                    "email": emailController.text,
                  };
                  getIt.get<CoffeeData>().addAccount(account);
                  usernameController.clear();
                  passwordController.clear();
                  emailController.clear();
                  confirmPasswordController.clear();

                  await showSuccessDialog();
                }
              },
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Log in',
                    style: const TextStyle(
                      color: Color(0xFFB98875),
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
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
}
