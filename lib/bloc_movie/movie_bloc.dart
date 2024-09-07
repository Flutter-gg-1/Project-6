import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as dd;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project6/data/movies_layer.dart';
import 'package:project6/data/users_layer.dart';
import 'package:project6/models/movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final movieLayer = GetIt.I.get<MoviesLayer>();
  final usersLayer = GetIt.I.get<UsersLayer>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? catValue;
  File? image;
  int id = dd.Random().nextInt(9999);
  MovieBloc() : super(MovieInitial()) {
    on<AddMovieEvent>(addMovieMethod);
    on<LoadMoivesEvent>(loadMovieMethod);
    on<DeleteMovieEvent>(deleteMovieMethod);
    on<EditMovieEvent>(editMovieMethod);
    on<ChangeImageEvent>(setNewImageMethod);
  }

  FutureOr<void> setNewImageMethod(ChangeImageEvent event, Emitter<MovieState> emit) {
    if(event.imagePath != image?.path) {
      emit(ImageChangedState());
    }
  }

  FutureOr<void> loadMovieMethod(LoadMoivesEvent event, Emitter<MovieState> emit) {
    emit(ShowMovieState(movies: usersLayer.currentUser!.userMovies));
  }

  FutureOr<void> addMovieMethod(AddMovieEvent event, Emitter<MovieState> emit) {
    Movie movie = Movie(
      id: id,
      name: nameController.text,
      category: event.category,
      year: dateController.text,
      posterImg: event.imagePath
    );
    log(movie.category);
    nameController.clear();
    dateController.clear();
    movieLayer.addMovie(movie: movie);

    log(usersLayer.currentUser!.userMovies.length.toString());
    image = null;
    usersLayer.usersBox.write('currentUser',usersLayer.currentUser);
    usersLayer.usersBox.write('users',usersLayer.users);
    emit(ShowMovieState(movies: usersLayer.currentUser!.userMovies));
  }

  FutureOr<void> deleteMovieMethod(DeleteMovieEvent event, Emitter<MovieState> emit) {
    movieLayer.deleteMovie(id: event.id);
    usersLayer.usersBox.write('currentUser',usersLayer.currentUser);
    usersLayer.usersBox.write('users',usersLayer.users);
    emit(ShowMovieState(movies: usersLayer.currentUser!.userMovies));
  }

  FutureOr<void> editMovieMethod(EditMovieEvent event, Emitter<MovieState> emit) {
    movieLayer.editMovie(
      id: event.id,
      newMovie: Movie(
        id: event.id,
        name: event.name,
        category: event.category,
        year: event.year,
        posterImg: event.posterImg
      )
    );
    usersLayer.usersBox.write('currentUser',usersLayer.currentUser);
    usersLayer.usersBox.write('users',usersLayer.users);
    emit(ShowMovieState(movies: usersLayer.currentUser!.userMovies));
  }
}
