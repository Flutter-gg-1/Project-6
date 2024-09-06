import 'package:get_it/get_it.dart';
import 'package:project6/data_layer/recipe_data.dart';

final locator = GetIt.instance;
setup() {
  locator.registerSingleton<RecipeData>(RecipeData());
}
