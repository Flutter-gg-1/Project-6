import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project6/data/users_layer.dart';
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
    GetIt.I.get<UsersLayer>().currentUser!.userMovies.add(movie);
    log(GetIt.I.get<UsersLayer>().currentUser!.userMovies.length.toString());
  }

  editMovie({required int id, required Movie newMovie}) {
    for (var movie in GetIt.I.get<UsersLayer>().currentUser!.userMovies) {
      if (movie.id == id) {
        movie.name = newMovie.name;
        movie.category = newMovie.category;
        movie.year = newMovie.year;
        movie.posterImg = newMovie.posterImg;
      }
    }
  }

  deleteMovie({required int id}) {
    GetIt.I.get<UsersLayer>().currentUser!.userMovies.removeWhere((element) => element.id == id);
  }
}
