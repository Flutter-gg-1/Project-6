import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as dd;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project6/data/movies_layer.dart';
import 'package:project6/models/movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final movieLayer = GetIt.I.get<MoviesLayer>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? catValue;
  File? image;
  int id = dd.Random().nextInt(9999);
  MovieBloc() : super(MovieInitial()) {
    on<AddMovieEvent>(addMovieMethod);
    on<LoadMoivesEvent>(loadMovieMethod);
    on<DeleteMovieEvent>(deleteMovieMethod);
  }

  FutureOr<void> loadMovieMethod(LoadMoivesEvent event, Emitter<MovieState> emit) {
    emit(ShowMovieState(movies: movieLayer.movies));
  }

  FutureOr<void> addMovieMethod(AddMovieEvent event, Emitter<MovieState> emit) {
    Movie movie = Movie(
          id: id,
          name: nameController.text,
          category: event.category,
          year: dateController.text,
          posterImg: image?.path ?? "assets/poster_holder.jpg");
    log(movie.category);
    nameController.clear();
    dateController.clear();
    movieLayer.addMovie(movie: movie);
    log(movieLayer.movies.length.toString());
    emit(ShowMovieState(movies: movieLayer.movies));
  }

  FutureOr<void> deleteMovieMethod(
      DeleteMovieEvent event, Emitter<MovieState> emit) {
    movieLayer.deleteMovie(id: id);
    emit(ShowMovieState(movies: movieLayer.movies));
  }
}
