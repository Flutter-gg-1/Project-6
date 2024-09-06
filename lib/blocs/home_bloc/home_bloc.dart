import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project6/data_layer/recipe_data.dart';
import 'package:project6/services/setup.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final dataLayer = locator.get<RecipeData>();
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      on<LoadDataEvent>(loadDataMethod);
      // on<EditRecipeEvent>(editRecipeMethod);
      on<LoadNewRecipeEvent>(loadNewRecipeMethod);
      on<RemoveRecipeEvent>(removeRecipeMethod);
    });
  }

  FutureOr<void> loadDataMethod(LoadDataEvent event, Emitter<HomeState> emit) {
    if (dataLayer.recipes.isNotEmpty) {
      emit(SuccessfulLoadState());
    }
  }

  // FutureOr<void> editRecipeMethod(
  //     EditRecipeEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> loadNewRecipeMethod(
      LoadNewRecipeEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> removeRecipeMethod(
      RemoveRecipeEvent event, Emitter<HomeState> emit) {}
}
