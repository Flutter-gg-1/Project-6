import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/screens/add_movie_screen.dart';
import 'package:project6/widgets/show_movies.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: const SafeArea(
            child: TabBarView(
          children: [
            ShowMovies(category: 'Comedy'),
            ShowMovies(category: 'Drama'),
            ShowMovies(category: 'Romance'),
            ShowMovies(category: 'Action'),
          ],
        )),
        floatingActionButton: FloatingActionButton(
            backgroundColor: ColorSelect.backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: ColorSelect.brandColor, width: 2)),
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
}
