import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// Define your bloc state class
@immutable
abstract class RecpState {}

class RecpInitial extends RecpState {}

// Define RecipeUpdatedState to represent the updated state
class RecipeUpdatedState extends RecpState {
  final String title;
  final String description;

  RecipeUpdatedState({
    required this.title,
    required this.description,
  });
}
