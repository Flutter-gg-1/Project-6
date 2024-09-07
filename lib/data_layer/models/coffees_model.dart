class CoffeeModel {
  String? nameOfCoffee;
  int? amount;
  double? price;
  String? size;
  int? sugar;

  CoffeeModel(
      {this.nameOfCoffee, this.amount, this.price, this.size, this.sugar});

  CoffeeModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    size = json['size'];
    sugar = json['sugar'];
    nameOfCoffee = json['coffe'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coffe'] = nameOfCoffee;
    data['amount'] = amount;
    data['sugar'] = sugar;
    data['size'] = size;
    data['price'] = price;
    return data;
  }
}
