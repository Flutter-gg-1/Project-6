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

  
  Map<String, dynamic> toJson() => {
        'id': id,
        'imgData': imgData,
        'title': title,
        'description': description,
        'rating': rating,
        'price': price
      };
}
