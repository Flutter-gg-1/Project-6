part of 'coffee_bloc.dart';

@immutable
sealed class CoffeeEvent {}

final class ChangeAmountEvent extends CoffeeEvent{}

final class ShowPasswordEvent extends CoffeeEvent{}
final class ShowConfirmPasswordEvent extends CoffeeEvent{}

final class AddCoffeeLoadEvent extends CoffeeEvent {}

final class LoadDataEvent extends CoffeeEvent{}
class TogglePasswordVisibilityEvent extends CoffeeEvent {}


class ToggleConfirmPasswordVisibilityEvent extends CoffeeEvent {}
