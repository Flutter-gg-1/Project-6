import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project6/data_layer/coffee_data.dart';
import 'package:project6/setup/init.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final datalayer = getIt.get<CoffeeData>();
  bool showPassword = false;
    bool showConfirmPassword = false;

  CoffeeBloc() : super(CoffeeInitial()) {
    on<ChangeAmountEvent>((event, emit) {
      emit(CoffeeAmountState());
    });
    on<ShowPasswordEvent>((event, emit) {
       showPassword = !showPassword;
      emit(ShowPasswordState(showPassword));
    });
     on<ShowConfirmPasswordEvent>((event, emit) {
       showConfirmPassword = !showConfirmPassword;
      emit(ShowConfirmPasswordState(showConfirmPassword));
    });
    on<AddCoffeeLoadEvent>((event, emit) async {
      emit(AddCoffeeLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(AddCoffeeLoaded());
    });
    on<LoadDataEvent>((event, emit) {
      if (datalayer.dataLayer.isNotEmpty) {
        emit(LoadedDataState());
      }
      emit(LoadingDataState());
    });
     on<TogglePasswordVisibilityEvent>((event, emit) {
      showPassword = !showPassword;
      emit(ShowPasswordState(showPassword));
    });
 on<ToggleConfirmPasswordVisibilityEvent>((event, emit) {
      showConfirmPassword = !showConfirmPassword;
      emit(ShowConfirmPasswordState(showConfirmPassword));
    });
  }
}


