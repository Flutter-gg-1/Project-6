class CoffeeModel {
  String? nameOfCoffee;
  String? coffeeImage;
  int? amount;
  double? price;
  String? size;
  int? sugar;

  CoffeeModel(
      {this.nameOfCoffee,
      this.amount,
      this.price,
      this.size,
      this.sugar,
      this.coffeeImage});

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      coffeeImage: json["coffeeImage"],
      price: json['price'],
      size: json['size'],
      sugar: json['sugar'],
      nameOfCoffee: json['nameOfCoffee'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() => {
        "coffeeImage": coffeeImage,
        "price": price,
        "size": size,
        "sugar": sugar,
        "namesOfCoffee": nameOfCoffee,
        "amount": amount
      };
}
