
import 'package:clothes_app/services/setup.dart';
import 'package:clothes_app/src/home_screen.dart';

import 'package:clothes_app/src/login_screen.dart';
import 'package:clothes_app/src/sign_up_screen.dart';

import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    return const MaterialApp(home: RegisterScreen());

  }
}