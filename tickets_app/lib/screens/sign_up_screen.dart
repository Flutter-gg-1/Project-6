import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tickets_app/extensions/string_ext.dart';
import 'package:tickets_app/widget/my_t_field.dart';
import '../extensions/color_ext.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: C.bg,
      body: SafeArea(
        child: Column(
          children: [
            MyTextField(),
          ],
        ),
      ),
    );
  }
}
