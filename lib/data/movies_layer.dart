import 'package:get_storage/get_storage.dart';
import 'package:project6/models/movie.dart';

class MoviesLayer {
  final List<Movie> movies = [
    Movie.fromJson({
      'id': 1,
      'name': "Fox Puss in Boots",
      'category': 'Comedy',
      'year': '2017',
      'posterImg': 'assets/fox_puss.png'
    }),
    Movie.fromJson({
      'id': 2,
      'name': "Me Time",
      'category': 'Comedy',
      'year': '2020',
      'posterImg': 'assets/me_time.png'
    }),
    Movie.fromJson({
      'id': 3,
      'name': "Avatar",
      'category': 'Sci-Fi',
      'year': '2009',
      'posterImg': 'assets/avatar.png'
    }),
    Movie.fromJson({
      'id': 4,
      'name': "The Arrival",
      'category': 'Sci-Fi',
      'year': '2021',
      'posterImg': 'assets/arrival.png'
    }),
    Movie.fromJson({
      'id': 5,
      'name': "The Arrival",
      'category': 'Sci-Fi',
      'year': '2021',
      'posterImg': 'assets/arrival.png'
    }),
    Movie.fromJson({
      'id': 6,
      'name': "The Arrival",
      'category': 'Sci-Fi',
      'year': '2021',
      'posterImg': 'assets/arrival.png'
    }),
    Movie.fromJson({
      'id': 7,
      'name': "Shawshank Redemption",
      'category': 'Drama',
      'year': '1994',
      'posterImg': 'assets/shawshank.png'
    }),
    Movie.fromJson({
      'id': 8,
      'name': "Hangover",
      'category': 'Comedy',
      'year': '2009',
      'posterImg': 'assets/hangover.png'
    })
  ];

  final List<String> categories = ['Comedy', 'Drama', 'Sci-Fi', 'Action'];

  final box = GetStorage();

  

  addMovie({required Movie movie}) {
    movies.add(movie);
  }

  // edit movie

  // delete movie
  deleteMovie({required int id}) {
    print(id.toString());
    print(movies.map((e) => e.id).toList().toString());
    movies.removeWhere((element) => element.id == id);
    print(movies.length.toString());
  }
}
