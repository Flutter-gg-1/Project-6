import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tickets_app/reusable_components/custom_text_btn.dart';
import '../../core/all_file.dart';
import '../../core/extensions/img_ext.dart';
import '../home_screen.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
  void _navigateToSignUp(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
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
                child: ListView(children: [
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: AspectRatio(
                        aspectRatio: 2, child: Image(image: Img.logo)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Sign In').styled(
                          size: 24, color: C.text1, weight: FontWeight.bold),
                      MyTextField(
                          controller: email,
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email)),
                      MyTextField(
                          controller: password,
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: const Icon(Icons.remove_red_eye)),
                      MyButton(text: 'Log in', onPressed: () {}),
                      CustomTextBtn(
                          title: 'Forgot Password?', callback: () => ()),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            const Text("Don't have an account?"),
                            const SizedBox(width: 4),
                            CustomTextBtn(
                                title: 'Sign Up',
                                callback: () => _navigateToSignUp(context)),
                          ],
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.google)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.facebook)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.apple)),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextBtn(
                      title: 'Continue as Guest?',
                      fontSize: 16,
                      callback: () => _navigateToHome(context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
