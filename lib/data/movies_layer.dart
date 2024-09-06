import 'package:project6/models/movie.dart';

class MoviesLayer {
  final List<Movie> movies = [
    Movie.fromJson({
      'name': "Fox Puss in Boots",
      'category': 'Comedy',
      'year': '2017',
      'posterImg': 'assets/fox_puss.png'
    }),
    Movie.fromJson({
      'name': "Me Time",
      'category': 'Comedy',
      'year': '2020',
      'posterImg': 'assets/me_time.png'
    }),
    Movie.fromJson({
      'name': "Avatar",
      'category': 'Sci-Fi',
      'year': '2009',
      'posterImg': 'assets/avatar.png'
    }),
    Movie.fromJson({
      'name': "The Arrival",
      'category': 'Sci-Fi',
      'year': '2021',
      'posterImg': 'assets/arrival.png'
    }),
    Movie.fromJson({
      'name': "The Arrival",
      'category': 'Sci-Fi',
      'year': '2021',
      'posterImg': 'assets/arrival.png'
    }),
    Movie.fromJson({
      'name': "The Arrival",
      'category': 'Sci-Fi',
      'year': '2021',
      'posterImg': 'assets/arrival.png'
    }),
    Movie.fromJson({
      'name': "Shawshank Redemption",
      'category': 'Drama',
      'year': '1994',
      'posterImg': 'assets/shawshank.png'
    }),
    Movie.fromJson({
      'name': "Hangover",
      'category': 'Comedy',
      'year': '2009',
      'posterImg': 'assets/hangover.png'
    })
  ];

  final List<String> categories = ['Comedy', 'Drama', 'Sci-Fi', 'Action'];

  // add movie

  addMovie({required Movie movie}) {
    movies.add(movie);
  }

  // edit movie
  editMoive({required int id, required Movie movie}) {
    for (var element in movies) {
      if (element.id == id) {
        element.name == movie.name;
        element.category == movie.category;
        element.year == movie.year;
      }
    }
  }

  // delete movie
  deleteMovie({required int id}) {
    movies.removeWhere((element) => element.id == id);
  }
}
