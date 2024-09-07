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
    on<UpdateRecipeInHomeEvent>(updateRecipeMethod);  // Add this
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

  FutureOr<void> updateRecipeMethod(UpdateRecipeInHomeEvent event, Emitter<HomeState> emit) {
    try {
      // Update the recipe in the data layer
      dataLayer.editRecipe(descrtipton: event.recipeDescription, recipe: event.recipe, title: event.recipeTitle);
      
      final updatedRecipes = dataLayer.recipes;
      emit(SuccessfulLoadState(recipes: updatedRecipes));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}
