import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tickets_app/reusable_components/custom_text_btn.dart';
import 'package:tickets_app/screens/login/login_bloc.dart';
import 'package:tickets_app/utils/validations.dart';
import '../../core/all_file.dart';
import '../../core/extensions/img_ext.dart';
import '../../reusable_components/custom_alert_dialog.dart';
import '../home_screen.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  void _navigateToSignUp(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CustomAlertDialog(
            title: 'Oops',
            content: 'No registered user with the provided email and password');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(builder: (context) {
        final bloc = BlocProvider.of<LoginBloc>(context);
        return BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is SuccessfulState) {
              _navigateToHome(context);
            }
            if (state is ErrorState) {
              _showAlert(context);
            }
          },
          child: Scaffold(
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
                                size: 24,
                                color: C.text1,
                                weight: FontWeight.bold),
                            MyTextField(
                                controller: bloc.emailController,
                                hintText: 'Email',
                                prefixIcon: const Icon(Icons.email),
                                validation: Validations.email),
                            MyTextField(
                              controller: bloc.passwordController,
                              hintText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: const Icon(Icons.remove_red_eye),
                              validation: Validations.pwd,
                            ),
                            MyButton(
                                text: 'Log in',
                                onPressed: () {
                                  bloc.add(
                                    LoginAttemptEvent(
                                        email: bloc.emailController.text,
                                        password: bloc.passwordController.text),
                                  );
                                }),
                            CustomTextBtn(
                                title: 'Forgot Password?', callback: () => ()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  const Text("Don't have an account?"),
                                  const SizedBox(width: 4),
                                  CustomTextBtn(
                                      title: 'Sign Up',
                                      callback: () =>
                                          _navigateToSignUp(context)),
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
                                    icon:
                                        const Icon(FontAwesomeIcons.facebook)),
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
          ),
        );
      }),
    );
  }
}
