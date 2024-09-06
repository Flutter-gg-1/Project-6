import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project6/data_layer/recipe_data.dart';
import 'package:project6/services/setup.dart';

import '../../models/recipe.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final dataLayer = locator.get<RecipeData>();
  HomeBloc() : super(HomeInitial()) {
    on<LoadDataEvent>(loadDataMethod);
    on<LoadNewRecipeEvent>(loadNewRecipeMethod);
    // on<RemoveRecipeEvent>(removeRecipeMethod);
    // on<EditRecipeEvent>(editRecipeMethod);
  }

  FutureOr<void> loadDataMethod(LoadDataEvent event, Emitter<HomeState> emit) {
    try {
      final recipes = dataLayer.recipes;
      emit(SuccessfulLoadState(recipes: recipes));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  FutureOr<void> loadNewRecipeMethod(
      LoadNewRecipeEvent event, Emitter<HomeState> emit) {
    try {
      final recipes = dataLayer.recipes;
      emit(SuccessfulLoadState(recipes: recipes));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  // FutureOr<void> editRecipeMethod(
  //     EditRecipeEvent event, Emitter<HomeState> emit) {}

  // FutureOr<void> removeRecipeMethod(
  //     RemoveRecipeEvent event, Emitter<HomeState> emit) {}
}
