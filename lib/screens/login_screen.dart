import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project6/components/custom_button.dart';
import 'package:project6/components/custom_text_field.dart';
import 'package:project6/data_layer/coffee_data.dart';
import 'package:project6/data_layer/data/accounts.dart';
import 'package:project6/screens/nav_bar.dart';
import 'package:project6/screens/signup_screen.dart';
import 'package:project6/setup/init.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 241),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: _formKey,
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
                              color: Colors.black38)
                        ],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    title: 'Email',
                    hintText: '',
                    controller: _emailController,
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
                    hintText: '',
                    controller: _passwordController,
                    isPassword: true,
                    showPassword: _showPassword,
                    togglePasswordView: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
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
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          accounts.isNotEmpty) {
                        final account = accounts.firstWhere(
                          (e) => e["email"] == _emailController.text,
                          orElse: () => {},
                        );
                        if (account["password"] == _passwordController.text) {
                          getIt.get<CoffeeData>().currentUser = account;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavBar()));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Failed'),
                              content: const Text('Invalid email or password.'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
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
          ),
        ),
      ),
    );
  }
}
