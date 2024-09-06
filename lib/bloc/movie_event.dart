part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

final class LoadMoivesEvent extends MovieEvent {}

final class AddMovieEvent extends MovieEvent {
  final String category;
  AddMovieEvent({required this.category});
}

final class DeleteMovieEvent extends MovieEvent {
  final int id;

  DeleteMovieEvent({required this.id});
}

final class EditMovieEvent extends MovieEvent {
  final int id;
  final String name;
  final String category;
  final String year;
  final String posterImg;

  EditMovieEvent(
      {required this.name,
      required this.category,
      required this.year,
      required this.posterImg,
      required this.id});
}
