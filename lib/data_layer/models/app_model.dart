import 'dart:math';

import 'package:clothes_app/data_layer/models/item_model.dart';
import 'package:clothes_app/data_layer/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AppModel {

  final box = GetStorage();
  UserModel? user;


  List<String> randomImgList = ["assets/image/card_image1.png"];

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


// load
  AppModel(){

  }


  

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

  void delIthem({required int id}) {
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i].id == id) {
        itemList.removeAt(i);
      }
    }
  }

  void addItem(
      {required String itemName,
      required String price,
      required String size,
      required Color color}) {



        itemList.add(ItemModel(id: Random().nextInt(99999), itemName: itemName, price: price, size: size, color: color, img: randomImgList[Random().nextInt(1)]));

      }
}
