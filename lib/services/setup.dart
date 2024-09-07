import 'package:clothes_app/data_layer/models/app_model.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

final getIt = GetIt.instance;


setup() {
  getIt.registerSingleton<AppModel>(AppModel());
}
