import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project6/bloc_movie/movie_bloc.dart';
import 'package:project6/data/movies_layer.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/widgets/button_widget.dart';
import 'package:project6/widgets/fields/add_field_widget.dart';
import 'package:project6/widgets/fields/catgories_widget.dart';
import 'package:project6/widgets/fields/image_field_widget.dart';

class AddMovieScreen extends StatelessWidget {
  
  const AddMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MovieBloc>();
    String selectedCategory = GetIt.I.get<MoviesLayer>().categories.first;
    return Scaffold(
      backgroundColor: const Color(0xff15141F),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff15141F),
        centerTitle: true,
        title: Text(
          "Add Movie",
          style: GoogleFonts.mulish(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700
          ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddFieldWidget(
                label: "Name",
                hint: "Enter movie name",
                controller: bloc.nameController
              ),
              const SizedBox(height: 40),
              CatgoriesWidget(radioButtonValue: (value) => selectedCategory = value),
              const SizedBox(height: 40),
              AddFieldWidget(
                label: "Year",
                hint: "Add movie date",
                controller: bloc.dateController
              ),
              const SizedBox(height: 40),
              ImageFieldWidget(
                onSelect: () async {
                  final selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                  bloc.image = File(selectedImage!.path);
                },
              ),
              const SizedBox(height: 40),
              ButtonWidget(
                title: 'Add',
                onPressed: () {
                  bloc.add(AddMovieEvent(category : selectedCategory));
                  context.pop();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
