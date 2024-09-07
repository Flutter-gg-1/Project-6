class CoffeeModel {
  String? coffe;
  int? amount;

  CoffeeModel({this.coffe, this.amount});

  CoffeeModel.fromJson(Map<String, dynamic> json) {
    coffe = json['coffe'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coffe'] = coffe;
    data['amount'] = amount;
    return data;
  }
}