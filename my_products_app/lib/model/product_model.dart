import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.name,
    required this.price,
    required this.category,
    required this.imageSrc,
    required this.quantity,
    required this.available,
  });
  late final String name;
  late final int price;
  late final String category;
  late final String imageSrc;
  late final int quantity;
  late final bool available;

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    category = json['category'];
    imageSrc = json['imageSrc'];
    quantity = json['quantity'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['category'] = category;
    data['imageSrc'] = imageSrc;
    data['quantity'] = quantity;
    data['available'] = available;
    return data;
  }

  static String encode(List<ProductModel> products) => json.encode(
        products
            .map<Map<String, dynamic>>((product) => product.toJson())
            .toList(),
      );

 static List<ProductModel> decode(String products) =>
      (json.decode(products) as List<dynamic>)
          .map<ProductModel>((product) => ProductModel.fromJson(product))
          .toList();
}
