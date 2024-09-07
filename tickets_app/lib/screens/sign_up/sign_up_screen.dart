import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tickets_app/screens/home_screen.dart';
import 'package:tickets_app/screens/sign_up/sign_up_bloc.dart';
import '../../core/all_file.dart';
import '../../core/extensions/img_ext.dart';
import '../../managers/user_mgr.dart';
import '../../reusable_components/custom_text_btn.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final userMgr = GetIt.I.get<UserMgr>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _navigateToLogin(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }

  File? selectedImg;

  void getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImg = File(img?.path ?? '');
  }

  // void addUser() async {
  //   String imgData = selectedImg != null
  //       ? await ImgConverter.fileImgToBase64(selectedImg!)
  //       : await ImgConverter.assetImgToData(Img.person1);
  //   var newUser = User(
  //     id: Random().nextInt(999),
  //     name: nameController.text,
  //     avatarData: imgData,
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  //
  //   await UserMgr().addUser(newUser);
  // }

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
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) {
                            if (state is SignUpInitial) {
                              return blocSignUp(context);
                            } else if (state is StateAfterWritingSignUp) {
                              return Column(
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
                                          child: (selectedImg != null)
                                              ? ClipOval(
                                                  child: Image.file(
                                                      selectedImg!,
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
                                        onPressed: getImage,
                                        icon: const Icon(
                                          Icons.add,
                                          color: C.accent,
                                          size: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                  MyTextField(
                                    controller: nameController,
                                    prefixIcon:
                                        const Icon(FontAwesomeIcons.user),
                                    hintText: 'Username',
                                  ),
                                  MyTextField(
                                    controller: emailController,
                                    prefixIcon:
                                        const Icon(FontAwesomeIcons.envelope),
                                    hintText: 'Email',
                                  ),
                                  MyTextField(
                                    controller: passwordController,
                                    prefixIcon:
                                        const Icon(FontAwesomeIcons.phone),
                                    hintText: 'Phone Number',
                                  ),
                                  MyButton(
                                    text: 'Sign Up',
                                    onPressed: () => bloc.add(
                                        EventAfterWritingSignUp(
                                            name: nameController.text,)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
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
                              );
                            }
                            return const SizedBox();
                          },
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

  Column blocSignUp(BuildContext context) {
    return Column(
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
                child: (selectedImg != null)
                    ? ClipOval(
                        child: Image.file(selectedImg!, fit: BoxFit.cover),
                      )
                    : const ClipOval(
                        child: Opacity(
                          opacity: 0.4,
                          child: Image(image: Img.person1, fit: BoxFit.contain),
                        ),
                      ),
              ),
            ),
            IconButton(
              onPressed: getImage,
              icon: const Icon(
                Icons.add,
                color: C.accent,
                size: 40,
              ),
            ),
          ],
        ),
        MyTextField(
          controller: nameController,
          prefixIcon: const Icon(FontAwesomeIcons.user),
          hintText: 'Username',
        ),
        MyTextField(
          controller: emailController,
          prefixIcon: const Icon(FontAwesomeIcons.envelope),
          hintText: 'Email',
        ),
        MyTextField(
          controller: passwordController,
          prefixIcon: const Icon(FontAwesomeIcons.phone),
          hintText: 'Phone Number',
        ),
        MyButton(text: 'Sign Up', onPressed: () => print(nameController.text)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              const Text("Already have an account?"),
              const SizedBox(width: 4),
              CustomTextBtn(
                  title: 'Login', callback: () => _navigateToLogin(context)),
            ],
          ),
        ),
      ],
    );
  }
}
