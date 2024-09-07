import 'package:get_storage/get_storage.dart';
import 'package:project6/data_layer/models/coffees_model.dart';

class CoffeeData {
  List<CoffeeModel> dataLayer = [];

  Map<String, dynamic> currentUser = {};
  final box = GetStorage();

  addNewCoffee({required CoffeeModel coffee}) {
    dataLayer.add(coffee);
  }
}
