import 'package:clothes_app/data_layer/models/app_model.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

final getIt = GetIt.instance;
final getItUser = GetIt.instance;

void setup() async {
   await GetStorage.init();
  getIt.registerSingleton<AppModel>(AppModel());
  // getIt.registerSingleton<AppModel>(AppModel());


  
}