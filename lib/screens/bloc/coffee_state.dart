part of 'coffee_bloc.dart';

@immutable
sealed class CoffeeState {}

final class CoffeeInitial extends CoffeeState {}

final class CoffeeAmountState extends CoffeeState{}

final class ShowPasswordState extends CoffeeState{
   final bool showPassword;

  ShowPasswordState(this.showPassword);
}

final class ShowConfirmPasswordState extends CoffeeState{
   final bool showConfirmPassword;

  ShowConfirmPasswordState(this.showConfirmPassword);
}
class AddCoffeeLoading extends CoffeeState {}

class AddCoffeeLoaded extends CoffeeState {}
class LoadedDataState extends CoffeeState {}
class LoadingDataState extends CoffeeState{}


