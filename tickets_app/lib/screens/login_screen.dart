import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/all_file.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: context.getScreenSize(multiplyWidth: 0.3)),
            RichText(
                text: const TextSpan(children: [
              TextSpan(text: 'Log in ', style: TextStyle(color: C.text3)),
              TextSpan(text: 'Sign in', style: TextStyle(color: C.text2)),
            ])),
            const MyTextField(hintText: 'Email', prefixIcon: Icon(Icons.email)),
            SizedBox(height: context.getScreenSize(multiplyWidth: 0.15)),
            const MyTextField(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye)),
            SizedBox(height: context.getScreenSize(multiplyWidth: 0.15)),
            MyButton(text: 'Log in', onPressed: () {}),
            SizedBox(height: context.getScreenSize(multiplyWidth: 0.1)),
            TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?').styled(color: C.text3)),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.google)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.facebook)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.apple)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
