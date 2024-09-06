import 'package:project6/models/movie.dart';

class MoviesLayer {
  final List<Movie> movies = [
    Movie.fromJson({
      'name': "Avatar",
      'category': 'Comedy',
      'year': '2022',
      'posterImg': 'assets/1.png'
    }),
    Movie.fromJson({
      'name': "Puss Fox",
      'category': 'Comedy',
      'year': '2022',
      'posterImg': 'assets/2.png'
    }),
    Movie.fromJson({
      'name': "Puss Fox",
      'category': 'Comedy',
      'year': '2022',
      'posterImg': 'assets/2.png'
    }),
    Movie.fromJson({
      'name': "Puss Fox",
      'category': 'Comedy',
      'year': '2022',
      'posterImg': 'assets/2.png'
    }),
    Movie.fromJson({
      'name': "Puss Fox",
      'category': 'Comedy',
      'year': '2022',
      'posterImg': 'assets/2.png'
    }),
  ];

  // add movie

  addMovie({required Movie movie}) {
    movies.add(movie);
  }

  // edit movie

  // delete movie
  deleteMovie({required int id}) {
    movies.removeWhere((element) => element.id == id);
  }
}
