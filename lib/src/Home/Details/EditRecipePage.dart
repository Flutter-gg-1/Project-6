import 'dart:io';
import 'package:flutter/material.dart';

class EditRecipePage extends StatefulWidget {
  final String initialRecipeTitle;
  final String initialDescription;
  final File imageFile;

  const EditRecipePage({
    super.key,
    required this.initialRecipeTitle,
    required this.initialDescription,
    required this.imageFile,
  });

  @override
  _EditRecipePageState createState() => _EditRecipePageState();
}

class _EditRecipePageState extends State<EditRecipePage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialRecipeTitle);
    _descriptionController =
        TextEditingController(text: widget.initialDescription);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Recipe"),
        backgroundColor: const Color(0xff7baaff),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // تنفيذ منطق الحفظ هنا
              Navigator.pop(context, {
                'title': _titleController.text,
                'description': _descriptionController.text,
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(
                widget.imageFile,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                'Meal Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the meal name',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Recipe Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the recipe description',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
