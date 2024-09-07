import 'package:flutter/material.dart';
import 'package:project6/screens/add_coffe_screen.dart';
import 'package:project6/screens/home_screen.dart';
import 'package:project6/screens/nav_bar.dart';
import 'package:project6/screens/welcome_screen.dart';
import 'package:project6/setup/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavBar(),
    );
  }
}
