class Room {
  int id;
  String imgData;
  String title;
  String description;
  double rating;
  int price;

  Room({
    required this.id,
    required this.imgData,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      imgData: json['imgData'],
      title: json['title'],
      description: json['description'],
      rating: json['rating'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'imgData': imgData,
        'title': title,
        'description': description,
        'rating': rating,
        'price': price
      };
}
