part of 'coffee_bloc.dart';

@immutable
sealed class CoffeeState {}

final class CoffeeInitial extends CoffeeState {}

final class CoffeeAmountState extends CoffeeState{}

final class ShowPasswordState extends CoffeeState{}
class AddCoffeeLoading extends CoffeeState {}

class AddCoffeeLoaded extends CoffeeState {}
class LoadedDataState extends CoffeeState {}
class LoadingDataState extends CoffeeState{}

class NavBarState extends CoffeeState{
  final int index;
  NavBarState({required this.index});
}

