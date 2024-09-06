import 'package:flutter/material.dart';
import 'package:project6/models/movie.dart';
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
                    return Expanded(
                      child: MovieCard(
                        movie: movies[index],
                      ),
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
