import 'package:flutter/material.dart';
import 'package:tickets_app/extensions/string_ext.dart';
import '../extensions/color_ext.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('SignUpScreen').styled(color: C.bg),
          ],
        ),
      ),
    );
  }
}
