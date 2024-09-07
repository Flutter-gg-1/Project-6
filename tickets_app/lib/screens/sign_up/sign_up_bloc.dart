import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/managers/user_mgr.dart';
import '../../core/extensions/img_ext.dart';
import '../../model/user.dart';
import '../../utils/img_converter.dart';
import '../../utils/validations.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final userMgr = GetIt.I.get<UserMgr>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  File? selectedImg;

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {});

    on<SignUpAttemptEvent>(signUp);
  }

  FutureOr<void> signUp(
      SignUpAttemptEvent event, Emitter<SignUpState> emit) async {
    String imgData = selectedImg != null
        ? await ImgConverter.fileImgToBase64(selectedImg!)
        : await ImgConverter.assetImgToData(Img.person2);

    if (isFormValid()) {
      var newUser = User(
        id: Random().nextInt(999),
        name: nameController.text,
        avatarData: imgData,
        email: emailController.text,
        password: passwordController.text,
      );

      await userMgr.addUser(newUser);
      await userMgr.setCurrentUser(newUser);

      emit(SignUpSuccessState());
    } else {
      emit(SignUpErrorState());
    }
  }

  bool isFormValid() {
    return Validations.emptyFieldValidation(nameController.text) == null &&
        Validations.email(emailController.text) == null &&
        Validations.pwd(passwordController.text) == null;
  }
}
