import 'package:project6/models/movie.dart';

class MoviesLayer {
  final List<Movie> movies = [
    Movie.fromJson(
      {
        'name' : "Avatar",
        'category' : 'Comedy',
        'date' : '2022-11-11',
        'posterImg' : 'assets/1.png'
      }
    ),
    Movie.fromJson(
      {
        'name' : "Puss Fox",
        'category' : 'Comedy',
        'date' : '2022-1-11',
        'posterImg' : 'assets/2.png'
      }
    ),
    Movie.fromJson(
      {
        'name' : "Puss Fox",
        'category' : 'Comedy',
        'date' : '2022-1-11',
        'posterImg' : 'assets/2.png'
      }
    ),
    Movie.fromJson(
      {
        'name' : "Puss Fox",
        'category' : 'Comedy',
        'date' : '2022-1-11',
        'posterImg' : 'assets/2.png'
      }
    ),
    Movie.fromJson(
      {
        'name' : "Puss Fox",
        'category' : 'Comedy',
        'date' : '2022-1-11',
        'posterImg' : 'assets/2.png'
      }
    )
  ];
}