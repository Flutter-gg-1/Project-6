import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project6/bloc_movie/movie_bloc.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/models/movie.dart';
import 'package:project6/widgets/button_widget.dart';
import 'package:project6/widgets/fields/add_field_widget.dart';
import 'package:project6/widgets/fields/catgories_widget.dart';
import 'package:project6/widgets/fields/image_field_widget.dart';

class EditMovieScreen extends StatelessWidget {
  final Movie movie;
  const EditMovieScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MovieBloc>();
    TextEditingController nameController =
        TextEditingController(text: movie.name);
    TextEditingController yearController =
        TextEditingController(text: movie.year);
    String category = movie.category;
    File? image;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xff15141F),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xff15141F),
          centerTitle: true,
          title: Text(
            "Edit Movie",
            style: GoogleFonts.mulish(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
          )),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AddFieldWidget(
                  label: "Name",
                  hint: "Movie name",
                  controller: nameController,
                  validator: (name) {
                    if (name!.trim().isEmpty) {
                      return 'name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                CatgoriesWidget(radioButtonValue: (value) => category = value),
                const SizedBox(height: 40),
                AddFieldWidget(
                  label: "Year",
                  hint: "Add movie year",
                  controller: yearController,
                  validator: (year) {
                    if (year!.trim().isEmpty) {
                      return 'Year is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Poster",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    IconButton(
                        onPressed: () async {
                          final selectedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          image = File(selectedImage!.path);
                        },
                        icon: const Icon(
                          Icons.add_photo_alternate_outlined,
                          color: Colors.white,
                        )),
                  ],
                ),
                BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    bloc.add(ChangeImageEvent(imagePath: image?.path));
                    if (state is ImageChangedState) {
                      return ImageFieldWidget(
                          imagePath: image?.path ?? 'assets/poster_holder.jpg');
                    }
                    return ImageFieldWidget(
                      imagePath: movie.posterImg,
                    );
                  },
                ),
                const SizedBox(height: 40),
                ButtonWidget(
                  title: 'Submit Changes',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(EditMovieEvent(
                          id: movie.id,
                          name: nameController.text,
                          year: yearController.text,
                          posterImg: image?.path ?? movie.posterImg,
                          category: category));
                      context.pop();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
