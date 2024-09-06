import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project6/bloc/movie_bloc.dart';
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
    return Scaffold(
        backgroundColor: const Color(0xff15141F),
        appBar: AppBar(
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
                    hint: "Enter movie name",
                    controller: bloc.nameController),
                const SizedBox(height: 40),
                CatgoriesWidget(
                  radioButtonValue: (value) {
                    bloc.catValue = value;
                    print(bloc.catValue);
                  },
                ),
                const SizedBox(height: 40),
                AddFieldWidget(
                    label: "Date",
                    hint: "Add movie date",
                    controller: bloc.dateController),
                const SizedBox(height: 40),
                ImageFieldWidget(
                  onSelect: () async {
                    final selectedImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    bloc.image = File(selectedImage!.path);
                  },
                ),
                const SizedBox(height: 40),
                ButtonWidget(
                    title: 'Add',
                    onPressed: () {
                      bloc.add(AddMovieEvent());

                      context.pop();
                    }),
              ],
            ),
          ),
        ),
      );
  }
}
