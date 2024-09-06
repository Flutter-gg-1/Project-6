import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project6/bloc_movie/movie_bloc.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/data/movies_layer.dart';
import 'package:project6/data/users_layer.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/screens/add_movie_screen.dart';
import 'package:project6/widgets/drawer_content.dart';
import 'package:project6/widgets/show_movies.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> categories = GetIt.I.get<MoviesLayer>().categories;
    final usersLayer = GetIt.I.get<UsersLayer>();
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: const Color(0xff15141F),
        drawer: Drawer(
          backgroundColor: ColorSelect.backgroundColor,
          child: DrawerContent(user: usersLayer.currentUser!),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xff15141F),
          title: Text(
            "Movies",
            style: GoogleFonts.mulish(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelStyle: const TextStyle(fontSize: 14),
            labelPadding: const EdgeInsets.symmetric(vertical: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: List.generate(categories.length, (index) => Text(categories[index])),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              final bloc = context.read<MovieBloc>();
              bloc.add(LoadMoivesEvent());
              if (state is ShowMovieState) {
                return TabBarView(children: List.generate(categories.length, (index)=>ShowMovies(category: categories[index])));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorSelect.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: ColorSelect.brandColor, width: 2)
          ),
          child: Icon(Icons.add,color: Colors.grey.shade400,size: 35),
          onPressed: () => context.push(screen: const AddMovieScreen())
        ),
      ),
    );
  }
}