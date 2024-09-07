part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

final class LoadMoivesEvent extends MovieEvent {}

final class ChangeImageEvent extends MovieEvent {
  final String? imagePath;
  ChangeImageEvent({required this.imagePath});
}

final class AddMovieEvent extends MovieEvent {
  final String category;
  final String imagePath;
  AddMovieEvent({required this.category, required this.imagePath});
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
