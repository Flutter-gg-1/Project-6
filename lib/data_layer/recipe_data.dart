import 'package:get_storage/get_storage.dart';
import '../models/recipe.dart';
import '../models/user.dart';

class RecipeData {
  List<Recipe> recipes = [];
  List<User> users = [];

  final box = GetStorage();

  RecipeData() {
    loadData();
  }

  loadData() async {
    // if (box.hasData('recipes')) {
    //   List<Map<String, dynamic>> listOfRecipes =
    //       List.from(await box.read('recipes')).cast<Map<String, dynamic>>();
    //   for (var recipe in listOfRecipes) {
    //     recipes.add(Recipe.fromJson(recipe));
    //   }
    // }
    // if (box.hasData('users')) {
    //   List<Map<String, dynamic>> listOfUsers =
    //       List.from(await box.read('users')).cast<Map<String, dynamic>>();
    //   for (var user in listOfUsers) {
    //     users.add(User.fromJson(user));
    //   }
    // }
  }

  // ----------- Recipes
  addRecipe(Recipe newRecipe) {
    recipes.add(newRecipe);
    saveRecipes();
  }

  deleteRecipe(Recipe recipe) {
    recipes.remove(recipe);
    saveRecipes();
  }

  saveRecipes() async {
    List<Map<String, dynamic>> listOfRecipes = [];
    for (var recipe in recipes) {
      listOfRecipes.add(recipe.toJson());
    }
    // await box.write("recipes", listOfRecipes);
  }

  editRecipe(
      {required Recipe recipe,
      required String title,
      required String descrtipton}) {
    recipe.recipeName = title;
    recipe.description = descrtipton;
    saveRecipes();
  }

  // ----------- Users
  registerNewUser(User user) {
    users.add(user);
    saveUsers();
  }

  saveLoginOrLogout(User user) {
    user.isLogged = !user.isLogged;
    // box.write('active', user.isLogged);
  }

  isLoggedIn(User user) async {
    return await box.read('active');
  }

  saveUsers() async {
    List<Map<String, dynamic>> listOfUsers = [];
    for (var user in users) {
      listOfUsers.add(user.toJson());
    }
    // await box.write("users", listOfUsers);
  }
}
