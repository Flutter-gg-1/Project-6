class Movie {
  String name;
  String category;
  String date;
  String posterImg;

  Movie({required this.name, required this.category, required this.date, required this.posterImg});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(name: json['name'], category: json['category'], date: json['date'], posterImg: json['posterImg']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'category' : category,
      'date' : date,
      'posterImg' : posterImg
    };
  }
}