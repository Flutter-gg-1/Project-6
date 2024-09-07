import 'package:get_storage/get_storage.dart';
import 'package:project6/data_layer/models/coffees_model.dart';

class CoffeeData {
  List<CoffeeModel> dataLayer = [];

  List<Map<String, dynamic>> accounts = [];

  Map<String, dynamic> currentUser = {};

  final box = GetStorage();

  CoffeeData() {
    loadData();
  }

  addNewCoffee({required CoffeeModel coffee}) {
    dataLayer.add(coffee);
    box.write("listOfCoffees", dataLayer);
  }

  loadData() {
    if (box.hasData("listOfCoffees")) {
      List<Map<String, dynamic>> coffeeList =
          List.from(box.read('listOfCoffees')).cast<Map<String, dynamic>>();
      for (var element in coffeeList) {
        dataLayer.add(CoffeeModel.fromJson(element));
      }
    }

    if (box.hasData("accounts")) {
      List<Map<String, dynamic>> account =
          List.from(box.read("accounts")).cast<Map<String, dynamic>>();
      for (var element in account) {
        accounts.add(element);
      }
    }
  }

  removeCoffee(String coffeeName) {
    dataLayer.removeWhere((e) => e.coffeeName == coffeeName);
    box.write("listOfCoffees", dataLayer);
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var element in dataLayer) {
      totalPrice += (element.amount! * element.price!);
    }
    return totalPrice;
  }

  addAccount(Map<String, dynamic> account) {
    accounts.add(account);
    box.write("accounts", accounts);
  }
}
