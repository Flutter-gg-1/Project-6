import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project6/data_layer/coffee_data.dart';

final getIt = GetIt.instance;


Future<void> setup() async {
  await GetStorage.init();
  GetIt.I.registerSingleton<CoffeeData>(CoffeeData());

}

