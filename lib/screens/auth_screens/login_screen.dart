import 'package:flutter/material.dart';
import 'package:project6/data_layer/data/coffee_data.dart';
import 'package:project6/components/form_widgets/loginform.dart';
import 'package:project6/screens/auth_screens/loading_screen.dart';
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
    if (formKey.currentState!.validate() && getIt.get<CoffeeData>().accounts.isNotEmpty) {
      final account = getIt.get<CoffeeData>().accounts.firstWhere(
        (e) => e["email"] == emailController.text,
        orElse: () => {},
      );
      if (account["password"] == passwordController.text) {
        getIt.get<CoffeeData>().currentUser = account;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoadingScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password.',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            backgroundColor: Color(0xFFB98875),
          ),
        );
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('There is no account.',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            backgroundColor:Color(0xFFB98875),
          ),
        );
    }
  }
}
