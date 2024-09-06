



import 'dart:math';

import 'package:clothes_app/data_layer/models/user_model.dart';

class AppModel {





  List<UserModel>  userList = [];




  void addUser({required String name, required String password , required String email}){


    userList.add(UserModel(email: email , name: name , password: password , id: Random().nextInt(99999)));

      UserModel user = userList.first;



   print({"  ${user.id}  ,,, ${user.name}   ,,,, ${user.password}, ,,,, ${user.email}  "});


  }

}