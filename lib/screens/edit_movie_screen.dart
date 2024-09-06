import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project6/bloc/movie_bloc.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/main.dart';
import 'package:project6/widgets/button_widget.dart';
import 'package:project6/widgets/fields/add_field_widget.dart';
import 'package:project6/widgets/fields/catgories_widget.dart';
import 'package:project6/widgets/fields/image_field_widget.dart';

class EditMoiveScreen extends StatelessWidget {
  final int id;
  final String currentName;
  final String currentCategory;
  final String currentDate;
  final String currentImage;

  const EditMoiveScreen({
    super.key,
    required this.currentName,
    required this.currentCategory,
    required this.currentDate,
    required this.id,
    required this.currentImage,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MovieBloc>();
    TextEditingController nameConttroler = TextEditingController();
    TextEditingController dateController = TextEditingController();
    String category = "";
    File? image;
    nameConttroler = TextEditingController(text: currentName);
    dateController = TextEditingController(text: currentDate);

    return Scaffold(
      backgroundColor: const Color(0xff15141F),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        forceMaterialTransparency: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddFieldWidget(
                  label: "Name",
                  hint: "Movie name",
                  controller: nameConttroler),
              const SizedBox(height: 40),
              CatgoriesWidget(
                radioButtonValue: (value) => category = value,
              ),
              const SizedBox(height: 40),
              AddFieldWidget(
                  label: "Date",
                  hint: "Add movie date",
                  controller: dateController),
              const SizedBox(height: 40),
              ImageFieldWidget(
                onSelect: () async {
                  final selectedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  image = File(selectedImage!.path);
                },
              ),
              const SizedBox(height: 40),
              ButtonWidget(
                title: 'Edit',
                onPressed: () {
                  bloc.add(EditMovieEvent(
                      id: id,
                      name: nameConttroler.text,
                      year: dateController.text,
                      posterImg: image?.path ?? currentImage,
                      category: category));
                  context.pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
