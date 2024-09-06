import 'package:flutter/material.dart';
import 'package:project6/bloc/movie_bloc.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/models/movie.dart';
import 'package:project6/screens/edit_movie_screen.dart';
import 'package:project6/widgets/cards/movie_card.dart';
import 'package:project6/widgets/no_movies_widget.dart';

class ShowMovies extends StatelessWidget {
  final String category;
  final bloc;
  const ShowMovies({super.key, required this.category, this.bloc});

  @override
  Widget build(BuildContext context) {
    // 5
    List<Movie> movies = bloc.movieLayer.movies
        .where((movie) => movie.category == category)
        .toList();
    return movies.isEmpty
        ? const NoMoviesWidget()
        : SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
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
                      onEdit: () {
                        context.push(
                            screen: EditMoiveScreen(
                          id: movies[index].id,
                          currentName: movies[index].name,
                          currentCategory: movies[index].category,
                          currentDate: movies[index].year,
                          currentImage: movies[index].posterImg,
                        ));
                      },
                      onDelete: () {
                        bloc.add(DeleteMovieEvent(id: movies[index].id));
                        context.pop();
                      },
                    );
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          );
  }
}
