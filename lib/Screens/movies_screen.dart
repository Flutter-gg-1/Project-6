import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project6/bloc/movie_bloc.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/data/movies_layer.dart';
import 'package:project6/data/users_layer.dart';
import 'package:project6/screens/add_movie_screen.dart';
import 'package:project6/screens/log_in_screen.dart';
import 'package:project6/widgets/button_widget.dart';
import 'package:project6/widgets/show_movies.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  // late MovieBloc bloc;
  @override
  Widget build(BuildContext context) {
    List<String> categories = GetIt.I.get<MoviesLayer>().categories;
    final usersLayer = GetIt.I.get<UsersLayer>();
    return BlocProvider(
      create: (context) => MovieBloc(),
      child: Builder(
        builder: (context) {
          return DefaultTabController(
            length: categories.length,
            child: Scaffold(
              backgroundColor: const Color(0xff15141F),
              drawer: Drawer(
                backgroundColor: ColorSelect.backgroundColor,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 150,
                    ),
                    Text('Hello, ${GetIt.I.get<UsersLayer>().currentUser!.name}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    Text(GetIt.I.get<UsersLayer>().currentUser!.email,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300)),
                    Text(GetIt.I.get<UsersLayer>().currentUser!.phone,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300)),
                    const SizedBox(
                      height: 100,
                    ),
                    ButtonWidget(
                        title: 'Sign Out',
                        color: Colors.red,
                        width: 200,
                        onPressed: () {
                          usersLayer.currentUser = null;
                          return Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const LogInScreen();
                          }));
                        }),
                  ],
                ),
              ),
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: const Color(0xff15141F),
                title: Text(
                  "Movies",
                  style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                centerTitle: true,
                bottom: TabBar(
                  labelStyle: const TextStyle(fontSize: 14),
                  labelPadding: const EdgeInsets.symmetric(vertical: 16),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: List.generate(
                      categories.length, (index) => Text(categories[index])),
                ),
              ),
              body: SafeArea(
                child: BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    final bloc = context.read<MovieBloc>();
                    bloc.add(LoadMoivesEvent());
                    if (state is ShowMovieState) {
                      return TabBarView(
                        children: categories.map((category) {
                          return ShowMovies(category: category, bloc: bloc);
                        }).toList(),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: ColorSelect.backgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                          color: ColorSelect.brandColor, width: 2)),
                  child: Icon(
                    Icons.add,
                    color: Colors.grey.shade400,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const AddMovieScreen();
                    }));
                  }),
            ),
          );
        }
      ),
    );
  }
}
