import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/all_file.dart';
import '../core/extensions/img_ext.dart';
import '../reusable_components/custom_text_btn.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  _navigateToLogin(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: AspectRatio(
                          aspectRatio: 2, child: Image(image: Img.logo)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 45,
                              backgroundColor: C.accent,
                              child: Icon(
                                FontAwesomeIcons.user,
                                color: C.bg,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const MyTextField(
                          prefixIcon: Icon(FontAwesomeIcons.user),
                          hintText: 'Username',
                        ),
                        const MyTextField(
                          prefixIcon: Icon(FontAwesomeIcons.envelope),
                          hintText: 'Email',
                        ),
                        const MyTextField(
                          prefixIcon: Icon(FontAwesomeIcons.phone),
                          hintText: 'Phone Number',
                        ),
                        MyButton(
                            text: 'Sign Up',
                            onPressed: () => _navigateToLogin(context)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              const Text("Already have an account?"),
                              const SizedBox(width: 4),
                              CustomTextBtn(
                                  title: 'Login',
                                  callback: () => _navigateToLogin(context)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextBtn(
                      title: 'Continue as Guest?',
                      fontSize: 16,
                      callback: () => ()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
