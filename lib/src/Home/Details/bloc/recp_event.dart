import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
@immutable
abstract class RecpEvent {}

class UpdateRecipeEvent extends RecpEvent {
  final String updatedTitle;
  final String updatedDescription;

  UpdateRecipeEvent(this.updatedTitle, this.updatedDescription);
}
