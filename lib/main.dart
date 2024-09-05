import 'package:flutter/material.dart';
import 'package:project_6/Screens/welcom_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomScreen()
    );
  }
}
