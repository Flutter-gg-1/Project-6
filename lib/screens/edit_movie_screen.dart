import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project6/widgets/button_widget.dart';
import 'package:project6/widgets/fields/add_field_widget.dart';
import 'package:project6/widgets/fields/catgories_widget.dart';
import 'package:project6/widgets/fields/image_field_widget.dart';

class EditMoiveScreen extends StatelessWidget {
  const EditMoiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    File? image;
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
              const AddFieldWidget(label: "Name", hint: "Movie name"),
              const SizedBox(height: 40),
              const CatgoriesWidget(),
              const SizedBox(height: 40),
              const AddFieldWidget(label: "Date", hint: "Add movie date"),
              const SizedBox(height: 40),
              ImageFieldWidget(
                onSelect: () async {
                  final selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                  image = File(selectedImage!.path);
                },
              ),
              const SizedBox(height: 40),
              const ButtonWidget(title: 'Edit')
            ],
          ),
        ),
      ),
    );
  }
}