import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project6/Screens/movies_screen.dart';
import 'package:project6/widgets/button_widget.dart';
import 'package:project6/widgets/fields/add_field_widget.dart';
import 'package:project6/widgets/fields/catgories_widget.dart';
import 'package:project6/widgets/fields/image_field_widget.dart';

class AddMovieScreen extends StatelessWidget {
  const AddMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    File? image;
    return Scaffold(
      backgroundColor: const Color(0xff15141F),
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff15141F),
        title: Text(
          "Add New Movie",
          style: GoogleFonts.mulish(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AddFieldWidget(label: "Name", hint: "Enter movie name"),
              const SizedBox(height: 40),
              const CatgoriesWidget(),
              const SizedBox(height: 40),
              const AddFieldWidget(label: "Date", hint: "Add movie date"),
              const SizedBox(height: 40),
              ImageFieldWidget(
                onSelect: () async {
                  final selectedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  image = File(selectedImage!.path);
                },
              ),
              const SizedBox(height: 40),
              const ButtonWidget(
                title: 'Add',
                toScreen: MoviesScreen(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
