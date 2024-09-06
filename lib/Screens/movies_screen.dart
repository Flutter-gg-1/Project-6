import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project6/bloc/movie_bloc.dart';
import 'package:project6/screens/add_movie_screen.dart';
import 'package:project6/widgets/show_movies.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MovieBloc>();
    bloc.add(LoadMoivesEvent());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xff15141F),
        drawer: const Drawer(
          child: Column(
            children: [
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xff15141F),
          title: Text(
            "Movies",
            style: GoogleFonts.mulish(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelStyle: TextStyle(fontSize: 14),
            labelPadding: EdgeInsets.symmetric(vertical: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Text("Comedy"),
              Text("Drama"),
              Text("Romance"),
              Text("Action"),
            ],
          ),
        ),
        body: SafeArea(child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is ShowMovieState) {
              return TabBarView(
                children: [
                  ShowMovies(category: 'Comedy', bloc: bloc),
                  ShowMovies(category: 'Drama', bloc: bloc),
                  ShowMovies(category: 'Romance', bloc: bloc),
                  ShowMovies(category: 'Action', bloc: bloc),
                ],
              );
            }
            return Text("data");
          },
        )),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddMovieScreen();
          }));
        }),
      ),
    );
  }
}
