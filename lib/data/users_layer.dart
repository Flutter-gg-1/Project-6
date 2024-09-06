import 'dart:developer';

import 'package:project6/models/user.dart';

class UsersLayer {

  final List<User> users = [
    User.fromJson({
      'name': 'turki',
      'email': 'turki@',
      'phone': '05456',
      'password': 'turki',
    })
  ];
  User? currentUser;
  
  UsersLayer(){
    log((currentUser?.name).toString());
  }

  void addUser({required String name,required String email,required String phone,required String password,}) {
    users.add(User(name: name, email: email, phone: phone, password: password));
  }
}
