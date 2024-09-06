import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project6/data_layer/recipe_data.dart';

final locator = GetIt.instance;
setup() async{
  await GetStorage.init();
  locator.registerSingleton<RecipeData>(RecipeData());
}
