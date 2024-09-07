import 'package:project6/models/movie.dart';

class User {
  final String name;
  final String email;
  final String phone;
  final String password;
  final List<Movie> userMovies;

  User({required this.name, required this.email, required this.phone, required this.password, required this.userMovies});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], email: json['email'], phone: json['phone'], password: json['password'], userMovies: json['userMovies']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'password' : password,
      'userMovies' : userMovies
    };
  }
}