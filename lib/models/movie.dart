import 'dart:math';

class Movie {
  int id;
  String name;
  String category;
  String year;
  String posterImg;

  Movie(
      {required this.id,
      required this.name,
      required this.category,
      required this.year,
      required this.posterImg});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json["id"] ?? Random().nextInt(9999),
        name: json['name'],
        category: json['category'],
        year: json['year'],
        posterImg: json['posterImg']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'year': year,
      'posterImg': posterImg
    };
  }
}
