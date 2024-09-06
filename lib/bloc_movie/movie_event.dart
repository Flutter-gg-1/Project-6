part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

final class LoadMoivesEvent extends MovieEvent {}

final class AddMovieEvent extends MovieEvent {}

final class DeleteMovieEvent extends MovieEvent {
  final int id;

  DeleteMovieEvent({required this.id});
}
