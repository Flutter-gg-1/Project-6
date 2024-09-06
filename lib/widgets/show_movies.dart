import 'package:flutter/material.dart';
import 'package:project6/bloc_movie/movie_bloc.dart';
import 'package:project6/extensions/nav.dart';
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
    List<Movie> movies = bloc.movieLayer.movies.where((movie) => movie.category == category).toList();
    return movies.isEmpty ? const NoMoviesWidget()
    : SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
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
          ),
        ],
      ),
    );
  }
}