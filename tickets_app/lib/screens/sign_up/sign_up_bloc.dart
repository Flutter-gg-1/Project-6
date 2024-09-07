
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/managers/user_mgr.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final userMgr = GetIt.I.get<UserMgr>();
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {});
    on<EventAfterWritingSignUp>((event, emit) {
      event.name;
      emit(StateAfterWritingSignUp());
    });
  }
}
