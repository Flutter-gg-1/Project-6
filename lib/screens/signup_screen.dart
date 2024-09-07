import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project6/screens/bloc/coffee_bloc.dart';
import 'package:project6/components/successdialog_signup.dart';
import 'package:project6/custom_widgets/signupform.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  Future<void> showSuccessDialog() async {
    animationController.forward();
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SuccessDialog(
          animationController: animationController,
          opacityAnimation: opacityAnimation,
          scaleAnimation: scaleAnimation,
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeBloc(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 248, 245),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SignupForm(showSuccessDialog: showSuccessDialog),
          ),
        ),
      ),
    );
  }
}
