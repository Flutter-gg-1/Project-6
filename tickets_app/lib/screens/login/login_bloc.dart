import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/managers/user_mgr.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final userMgr = GetIt.I.get<UserMgr>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loginSuccessful = false;

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<LoginAttemptEvent>(signIn);
  }

  FutureOr<void> signIn(LoginAttemptEvent event, Emitter<LoginState> emit) {
    String email = event.email;
    String password = event.password;

    var user = userMgr.allUsers
        .where((user) => (user.email == email && user.password == password))
        .firstOrNull;

    print('Hello');

    if (user != null) {
      userMgr.setCurrentUser(user);
      emit(SuccessfulState());
    } else {
      emit(ErrorState());
    }
  }
}
