import 'dart:math';

import 'package:clothes_app/data_layer/models/item_model.dart';
import 'package:clothes_app/data_layer/models/user_model.dart';
import 'package:flutter/material.dart';

class AppModel {
  UserModel? user;

  List<UserModel> userList = [];

  List<ItemModel> itemList = [
    ItemModel(
        id: 1,
        itemName: "h1",
        price: "21",
        size: "S",
        color: Colors.blue,
        img: "assets/image/card_image1.png"),
    ItemModel(
        id: 2,
        itemName: "h2",
        price: "22",
        size: "M",
        color: Colors.blue,
        img: "assets/image/card_image1.png"),
    ItemModel(
        id: 3,
        itemName: "h3",
        price: "23",
        size: "L",
        color: Colors.blue,
        img: "assets/image/card_image1.png"),
  ];

  void addUser(
      {required String name, required String password, required String email}) {
    userList.add(UserModel(
        email: email,
        name: name,
        password: password,
        id: Random().nextInt(99999)));

    UserModel user = userList.first;

    print({
      "  ${user.id}  ,,, ${user.name}   ,,,, ${user.password}, ,,,, ${user.email}  "
    });
  }

  bool userCheck({required String name, required String password}) {
    for (int i = 0; i < userList.length; i++) {
      if (userList[i].name == name && userList[i].password == password) {
        user = userList[i];

        return true;
      }
    }

    return false;
  }

  void updateItem(
      {required String itemName,
      required String price,
      required String size,
      required Color color,
      required int id}) {
    for (var val in itemList) {
      if (val.id == id) {
        val.itemName = itemName;
        val.price = price;
        val.size = size;
        val.color = color;

        print("value change");
      }
    }
  }



  void delIthem({required int id}){

    for(int i = 0 ; i <itemList.length; i++){

      if(itemList[i].id == id){

        itemList.removeAt(i);
      }



    }


  }
}
