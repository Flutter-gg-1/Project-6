import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tickets_app/screens/home_screen.dart';
import 'package:tickets_app/screens/login/login_bloc.dart';
import 'package:tickets_app/screens/sign_up/sign_up_bloc.dart';
import 'package:tickets_app/utils/validations.dart';
import '../../core/all_file.dart';
import '../../core/extensions/img_ext.dart';
import '../../reusable_components/custom_text_btn.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  void _navigateToLogin(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }

  void getImage(BuildContext context) async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (context.mounted) {
      var bloc = context.read<SignUpBloc>();
      bloc.selectedImg = File(img?.path ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<SignUpBloc>();
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
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 75, // Minimum width
                                    maxHeight: 75,
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: (bloc.selectedImg != null)
                                        ? ClipOval(
                                            child: Image.file(bloc.selectedImg!,
                                                fit: BoxFit.cover),
                                          )
                                        : const ClipOval(
                                            child: Opacity(
                                              opacity: 0.4,
                                              child: Image(
                                                  image: Img.person1,
                                                  fit: BoxFit.contain),
                                            ),
                                          ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => getImage(context),
                                  icon: const Icon(
                                    Icons.add,
                                    color: C.accent,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            MyTextField(
                              controller: bloc.nameController,
                              prefixIcon: const Icon(FontAwesomeIcons.user),
                              hintText: 'Username',
                              validation: Validations.emptyFieldValidation,
                            ),
                            MyTextField(
                              controller: bloc.emailController,
                              prefixIcon: const Icon(FontAwesomeIcons.envelope),
                              hintText: 'Email',
                              validation: Validations.email,
                            ),
                            MyTextField(
                              controller: bloc.passwordController,
                              prefixIcon: const Icon(FontAwesomeIcons.lock),
                              hintText: 'Password',
                              validation: Validations.pwd,
                            ),
                            MyButton(
                              text: 'Sign Up',
                              onPressed: () => bloc.add(
                                SignUpAttemptEvent(),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                children: [
                                  const Text("Already have an account?"),
                                  const SizedBox(width: 4),
                                  CustomTextBtn(
                                      title: 'Login',
                                      callback: () =>
                                          _navigateToLogin(context)),
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
                          callback: () => _navigateToHome(context)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // Column blocSignUp(BuildContext context) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           ConstrainedBox(
  //             constraints: const BoxConstraints(
  //               maxWidth: 75, // Minimum width
  //               maxHeight: 75,
  //             ),
  //             child: Container(
  //               decoration: const BoxDecoration(
  //                 shape: BoxShape.circle,
  //               ),
  //               child: (bloc.selectedImg != null)
  //                   ? ClipOval(
  //                       child: Image.file(bloc.selectedImg!, fit: BoxFit.cover),
  //                     )
  //                   : const ClipOval(
  //                       child: Opacity(
  //                         opacity: 0.4,
  //                         child: Image(image: Img.person1, fit: BoxFit.contain),
  //                       ),
  //                     ),
  //             ),
  //           ),
  //           IconButton(
  //             onPressed: getImage,
  //             icon: const Icon(
  //               Icons.add,
  //               color: C.accent,
  //               size: 40,
  //             ),
  //           ),
  //         ],
  //       ),
  //       MyTextField(
  //         controller: nameController,
  //         prefixIcon: const Icon(FontAwesomeIcons.user),
  //         hintText: 'Username',
  //       ),
  //       MyTextField(
  //         controller: emailController,
  //         prefixIcon: const Icon(FontAwesomeIcons.envelope),
  //         hintText: 'Email',
  //       ),
  //       MyTextField(
  //         controller: passwordController,
  //         prefixIcon: const Icon(FontAwesomeIcons.phone),
  //         hintText: 'Phone Number',
  //       ),
  //       MyButton(text: 'Sign Up', onPressed: () => print(nameController.text)),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 4.0),
  //         child: Row(
  //           children: [
  //             const Text("Already have an account?"),
  //             const SizedBox(width: 4),
  //             CustomTextBtn(
  //                 title: 'Login', callback: () => _navigateToLogin(context)),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
