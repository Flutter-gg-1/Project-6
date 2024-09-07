import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project6/bloc_movie/movie_bloc.dart';
import 'package:project6/data/users_layer.dart';
import 'package:project6/models/user.dart';
import 'package:project6/screens/movies_screen.dart';
import 'package:project6/services/setup.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:project6/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  setup();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = GetIt.I.get<UsersLayer>().currentUser;
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: MaterialApp(home: user!=null ? const MoviesScreen() : const WelcomeScreen()),
    );
  }
}
