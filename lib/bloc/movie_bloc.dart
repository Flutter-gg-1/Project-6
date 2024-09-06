import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
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
  int id = Random().nextInt(9999);
  MovieBloc() : super(MovieInitial()) {
    on<AddMovieEvent>(loadMovieMehtod);
    on<LoadMoivesEvent>(addMovieMehtod);
    on<DeleteMovieEvent>(deleteMovieMehtod);
  }

  FutureOr<void> loadMovieMehtod(
      AddMovieEvent event, Emitter<MovieState> emit) {
    emit(ShowMovieState(movies: movieLayer.movies));
  }

  FutureOr<void> addMovieMehtod(MovieEvent event, Emitter<MovieState> emit) {
    movieLayer.addMovie(
        movie: Movie(
            id: id,
            name: nameController.text,
            category: catValue ?? "No categoray",
            year: dateController.text,
            posterImg: image?.path ?? "assets/poster_holder.jpg"));
    emit(ShowMovieState(movies: movieLayer.movies));
  }

  FutureOr<void> deleteMovieMehtod(
      DeleteMovieEvent event, Emitter<MovieState> emit) {
    movieLayer.deleteMovie(id: id);
    emit(ShowMovieState(movies: movieLayer.movies));
  }
}
