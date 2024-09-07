import 'dart:math';

import 'dart:developer' as lg;

import 'package:clothes_app/data_layer/models/item_model.dart';
import 'package:clothes_app/data_layer/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AppModel {
  final box = GetStorage();
  UserModel? user;

  List<String> randomImgList = [
    "assets/image/card_image1.png",
    "assets/image/card_image2.png",
    "assets/image/card_image3.png",
    "assets/image/card_image4.png",
  ];

  List<UserModel> userList = [];

  List<ItemModel> itemList = [];

  AppModel() {
    loadItem();
  }

  void addUser(
      {required String name, required String password, required String email}) {
    userList.add(UserModel(
        email: email,
        name: name,
        password: password,
        id: Random().nextInt(99999)));
    saveUser();
  }

  bool userChecker({required String name, required String password}) {
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
      }
    }
    saveItem();
  }

  void removeItem({required int id}) {
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i].id == id) {
        itemList.removeAt(i);
      }
    }
    saveItem();
  }

  void addItem(
      {required String itemName,
      required String price,
      required String size,
      required Color color}) {
    itemList.add(ItemModel(
        id: Random().nextInt(99999),
        itemName: itemName,
        price: price,
        size: size,
        color: color,
        img: randomImgList[Random().nextInt(3)]));
    saveItem();
  }

  Future<void> saveItem() async {
    List<Map<String, dynamic>> itemAsMap = [];
    for (var element in itemList) {
      itemAsMap.add(element.toJson());
    }
    await box.write('items', itemAsMap);
    
  }

  Future<void> saveUser() async {
    List<Map<String, dynamic>> usersAsMap = [];
    for (var element in userList) {
      usersAsMap.add(element.toJson());
    }
    await box.write('users', usersAsMap);
  }

  loadItem(){
    if (!box.hasData('items')) {
     lg.log('False') ;
    }
  }
}
