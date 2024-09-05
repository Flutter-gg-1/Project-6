import 'package:flutter/material.dart';
import 'package:tickets_app/extensions/string_ext.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('HomeScreen').styled(),
          ],
        ),
      ),
    );
  }
}
