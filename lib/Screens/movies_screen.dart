import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/data/movies_layer.dart';
import 'package:project6/data/users_layer.dart';
import 'package:project6/screens/add_movie_screen.dart';
import 'package:project6/screens/welcome_screen.dart';
import 'package:project6/widgets/button_widget.dart';
import 'package:project6/widgets/show_movies.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = GetIt.I.get<MoviesLayer>().categories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: const Color(0xff15141F),
        drawer: Container(
          // margin: EdgeInsets.only(top: 80),
          // constraints: BoxConstraints(maxHeight: context.getHeight(divideBy: 1.2)),
          child: Drawer(
            backgroundColor: ColorSelect.backgroundColor,
            child: Column(
              children: [
                const SizedBox(height: 150,),
                Image.asset('assets/logo.png', width: 150,),
                Text('Hello, ${GetIt.I.get<UsersLayer>().currentUser!.name}', style: const TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w700),),
                Text(GetIt.I.get<UsersLayer>().currentUser!.email, style: const TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                Text(GetIt.I.get<UsersLayer>().currentUser!.phone, style: const TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                const SizedBox(height: 100,),
                const ButtonWidget(title: 'Sign Out', color: Colors.red, width: 200, toScreen: WelcomeScreen(),)
              ],
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xff15141F),
          title: Text("Movies",style: GoogleFonts.mulish(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
          centerTitle: true,
          bottom: TabBar(
            labelStyle: const TextStyle(fontSize: 14),
            labelPadding: const EdgeInsets.symmetric(vertical: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: List.generate(categories.length, (index)=>Text(categories[index])),
          ),
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TabBarView(children: List.generate(categories.length, (index)=>ShowMovies(category: categories[index]))),
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