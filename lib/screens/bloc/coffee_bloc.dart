import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project6/data_layer/data/coffee_data.dart';
import 'package:project6/setup/init.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final datalayer = getIt.get<CoffeeData>();
  int sugar = 0;
  int size = 0;
  bool showPassword = false;
  bool showConfirmPassword = false;

  CoffeeBloc() : super(CoffeeInitial()) {
    on<ChangeAmountEvent>((event, emit) {
      emit(CoffeeAmountState());
      emit(LoadedDataState());
    });
    on<ShowPasswordEvent>((event, emit) {
      showPassword = !showPassword;
      emit(ShowPasswordState(showPassword));
    });
    on<ShowConfirmPasswordEvent>((event, emit) {
      showConfirmPassword = !showConfirmPassword;
      emit(ShowConfirmPasswordState(showConfirmPassword));
    });
    on<DeleteDataEvent>((event, emit) {
      emit(LoadedDataState());
    });
    on<ChooseCupEvent>((event, emit) {
      sugar = event.sugarCubes!;
      emit(ChooseSugarState());
    });
    on<ChooseCupSizeEvent>((event, emit) {
      size = event.cupSize!;
      emit(ChooseCupSizeState());
    });
    on<AddCoffeeLoadEvent>((event, emit) async {
      emit(AddCoffeeLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      emit(AddCoffeeLoaded());
    });
    on<LoadDataEvent>((event, emit) {
      if (datalayer.dataLayer.isNotEmpty) {
        emit(LoadedDataState());
      }
    });

    on<LoadingScreenEvent>(LoadingScreenMethod);

    on<NavBarEvent>((event, emit) {
      emit(NavBarState(index: event.index));
    });
    on<TogglePasswordVisibilityEvent>((event, emit) {
      showPassword = !showPassword;
      emit(ShowPasswordState(showPassword));
    });
    on<ToggleConfirmPasswordVisibilityEvent>((event, emit) {
      showConfirmPassword = !showConfirmPassword;
      emit(ShowConfirmPasswordState(showConfirmPassword));
    });
  }

  // ignore: non_constant_identifier_names
  FutureOr<void> LoadingScreenMethod(
      LoadingScreenEvent event, Emitter<CoffeeState> emit) async {
    emit(LoadingScreenState());
    await Future.delayed(const Duration(seconds: 3));
    emit(SuccessNavgationState());
  }
}
