import 'package:flutter/material.dart';


import 'package:project6/data_layer/coffee_data.dart';
import 'package:project6/data_layer/data/accounts.dart';
import 'package:project6/custom_widgets/loginform.dart';
import 'package:project6/screens/nav_bar.dart';
import 'package:project6/setup/init.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 244, 241),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: LoginForm(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
            showPassword: showPassword,
            onPasswordToggle: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            onLogin: handleLogin,
          ),
        ),
      ),
    );
  }

  void handleLogin() {
     print("Login button pressed");
    if (formKey.currentState!.validate() && accounts.isNotEmpty) {
      final account = accounts.firstWhere(
        (e) => e["email"] == emailController.text,
        orElse: () => {},
      );
      if (account["password"] == passwordController.text) {
        getIt.get<CoffeeData>().currentUser = account;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavBar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Invalid email or password.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('There is no account.'),
            backgroundColor: Colors.red,
          ),
        );
    }
  }
}
