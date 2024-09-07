import 'package:meta/meta.dart';

@immutable
abstract class RecpState {}

class RecpInitial extends RecpState {}

class RecipeUpdatedState extends RecpState {
  final String title;
  final String description;

  RecipeUpdatedState({
    required this.title,
    required this.description,
  });
}
