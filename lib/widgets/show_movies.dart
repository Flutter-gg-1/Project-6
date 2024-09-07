import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project6/bloc_movie/movie_bloc.dart';
import 'package:project6/data/users_layer.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/extensions/screen_size.dart';
import 'package:project6/models/movie.dart';
import 'package:project6/screens/edit_movie_screen.dart';
import 'package:project6/widgets/cards/movie_card.dart';
import 'package:project6/widgets/no_movies_widget.dart';

class ShowMovies extends StatelessWidget {
  final String category;
  final dynamic bloc;
  const ShowMovies({super.key, required this.category, this.bloc});

  @override
  Widget build(BuildContext context) {
    // filtered movies based on given category
    List<Movie> movies = GetIt.I.get<UsersLayer>().currentUser!.userMovies.where((movie) => movie.category == category).toList();
    return movies.isEmpty ? const NoMoviesWidget()
    : GridView.builder(
      padding: EdgeInsets.all(10),
      physics: ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.getWidth() < 810 ? 2 : 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2.67 / 5,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(
          movie: movies[index],
          onEdit: () => context.push(screen: EditMovieScreen(movie: movies[index])),
          onDelete: () {
            bloc.add(DeleteMovieEvent(id: movies[index].id));
            context.pop();
          },
        );
      },
    );
  }
}