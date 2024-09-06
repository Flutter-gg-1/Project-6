import 'package:flutter/foundation.dart';
import 'package:my_products_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataLayer {
  UserDataLayer() {
    users.add(UserModel(
        name: "name",
        password: "1234",
        id: 1,
        cr: "3214",
        email: "email@",
        status: false));
    inti();
    loadUser();
  }
  List<UserModel> users = [];

  late final SharedPreferences storage;

  void inti() async {
    storage = await SharedPreferences.getInstance();
  }

  bool checkUser({required String email, required String password}) {
    for (UserModel element in users) {
      if (element.email == email && element.password == password) {
        return true;
      }
    }
    return false;
  }

  void saveUser(
      {required String name,
      required String pass,
      required String cr,
      required String email,
      required bool status}) {
    UserModel user = UserModel(
        name: name,
        password: pass,
        id: users.length + 1,
        cr: cr,
        email: email,
        status: status);
    saveUserStorage(user);
  }

  void saveUserStorage(UserModel user) {
    try {
      storage.setString("user", UserModel.encode(users));
    } catch (e) {
      if (kDebugMode) {
        print("error in saving user");
      }
    }
  }

  void loadUser() {
    try {
      if (storage.containsKey("user")) {
        users = UserModel.decode(storage.getString("product")!);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in load user data");
      }
    }
  }
}