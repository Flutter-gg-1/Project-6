import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/all_file.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Sign Up').styled(color: C.accent),
              SizedBox(height: context.getScreenSize(multiplyWidth: 0.4)),
              Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: C.accent,
                        child: Icon(
                          FontAwesomeIcons.user,
                          color: C.bg,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: CircleAvatar(
                            radius: 55,
                            child: IconButton(
                                onPressed: () {}, icon: const Icon(Icons.add))),
                      ),
                    ],
                  ),
                  SizedBox(height: context.getScreenSize(multiplyWidth: 0.05)),
                  const MyTextField(
                    prefixIcon: Icon(FontAwesomeIcons.user),
                    hintText: 'Username',
                  ),
                  SizedBox(height: context.getScreenSize(multiplyWidth: 0.05)),
                  const MyTextField(
                    prefixIcon: Icon(FontAwesomeIcons.envelope),
                    hintText: 'Email',
                  ),
                  SizedBox(height: context.getScreenSize(multiplyWidth: 0.05)),
                  const MyTextField(
                    prefixIcon: Icon(FontAwesomeIcons.phone),
                    hintText: 'Phone Number',
                  ),
                  SizedBox(height: context.getScreenSize(multiplyWidth: 0.05)),
                  MyButton(text: 'Sign Up', onPressed: () {}),
                  SizedBox(height: context.getScreenSize(multiplyWidth: 0.05)),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Skip').styled(color: C.text2)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
