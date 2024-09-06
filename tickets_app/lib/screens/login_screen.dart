import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tickets_app/reusable_components/custom_text_btn.dart';
import 'package:tickets_app/screens/sign_up_screen.dart';
import '../core/all_file.dart';
import '../core/extensions/img_ext.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _navigate(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
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
                      const MyTextField(
                          hintText: 'Email', prefixIcon: Icon(Icons.email)),
                      const MyTextField(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye)),
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
                                callback: () => _navigate(context)),
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
            ],
          ),
        ),
      ),
    );
  }
}
