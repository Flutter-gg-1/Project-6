import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/components/custom_button.dart';
import 'package:project6/components/custom_text_field.dart';
import 'package:project6/data_layer/data/accounts.dart';
import 'package:project6/screens/bloc/coffee_bloc.dart';
import 'package:project6/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _showPassword = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  Future<void> _showSuccessDialog() async {
    _animationController.forward();
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 80,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          textAlign: TextAlign.center,
                          'Registration Successful!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'You have successfully signed up. You can now log in to your account.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _animationController.reverse();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 248, 245),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
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
                          'Sign Up',
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
                      const SizedBox(height: 16),
                      CustomTextField(
                        title: 'Username',
                        hintText: '',
                        controller: _usernameController,
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
                        hintText: '',
                        controller: _emailController,
                        validator: (value) {
                          bool isUsed = accounts
                              .any((account) => account["email"] == value);
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
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
                          return CustomTextField(
                            title: 'Password',
                            hintText: '',
                            controller: _passwordController,
                            isPassword: true,
                            showPassword: _showPassword,
                            togglePasswordView: () {
                              _showPassword = !_showPassword;
                              context
                                  .read<CoffeeBloc>()
                                  .add(ShowPasswordEvent());
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
                          return CustomTextField(
                            title: 'Re-enter password',
                            hintText: '',
                            controller: _confirmPasswordController,
                            isPassword: true,
                            showPassword: _showPassword,
                            togglePasswordView: () {
                              context
                                  .read<CoffeeBloc>()
                                  .add(ShowPasswordEvent());
                              _showPassword = !_showPassword;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
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
                          if (_formKey.currentState!.validate()) {
                            Map<String, dynamic> account = {
                              "name": _usernameController.text,
                              "password": _passwordController.text,
                              "email": _emailController.text,
                            };
                            accounts.add(account);
                            _usernameController.clear();
                            _passwordController.clear();
                            _emailController.clear();
                            _confirmPasswordController.clear();

                            await _showSuccessDialog();
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
                                        builder: (context) =>
                                            const LoginScreen()),
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
      }),
    );
  }
}
