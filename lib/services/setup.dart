import 'package:get_it/get_it.dart';
import 'package:project6/data/movies_layer.dart';
import 'package:project6/data/users_layer.dart';
void setup() {
  GetIt.I.registerSingleton<MoviesLayer>(MoviesLayer());
  GetIt.I.registerSingleton<UsersLayer>(UsersLayer());
}