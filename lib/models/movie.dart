class Movie {
  String name;
  String category;
  String year;
  String posterImg;

  Movie({required this.name, required this.category, required this.year, required this.posterImg});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(name: json['name'], category: json['category'], year: json['year'], posterImg: json['posterImg']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'category' : category,
      'year' : year,
      'posterImg' : posterImg
    };
  }
}