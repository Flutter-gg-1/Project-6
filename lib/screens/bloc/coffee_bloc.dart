import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project6/data_layer/coffee_data.dart';
import 'package:project6/setup/init.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final datalayer = getIt.get<CoffeeData>();
  int sugar = 0;
  int size = 0;
  CoffeeBloc() : super(CoffeeInitial()) {
    on<ChangeAmountEvent>((event, emit) {
      emit(CoffeeAmountState());
      emit(LoadedDataState());
    });
    on<ShowPasswordEvent>((event, emit) {
      emit(ShowPasswordState());
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
      await Future.delayed(const Duration(seconds: 3));
      emit(AddCoffeeLoaded());
    });
    on<LoadDataEvent>((event, emit) {
      if (datalayer.dataLayer.isNotEmpty) {
        print(datalayer.dataLayer);
        emit(LoadedDataState());
      }
    });

    on<NavBarEvent>((event, emit) {
      emit(NavBarState(index: event.index));
    });
  }
}
