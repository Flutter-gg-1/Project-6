part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class ShowMovieState extends MovieState {
  final List<Movie> movies;

  ShowMovieState({required this.movies});
}
