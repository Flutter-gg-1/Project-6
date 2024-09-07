import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/widget/button/button_text.dart';
import 'package:clothes_app/widget/container/select_color_container.dart';
import 'package:clothes_app/widget/text_field/custome_text_field.dart';
import 'package:flutter/material.dart';

class UpdateItemScreen extends StatelessWidget {
  const UpdateItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color selectedColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update item',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTextField(
                    hintText: 'item name', hasSuffixIcon: false),
                SizedBox(
                  height: context.getHeight() * 0.04,
                ),
                const CustomTextField(hintText: 'price', hasSuffixIcon: false),
                SizedBox(
                  height: context.getHeight() * 0.04,
                ),
                const CustomTextField(hintText: 'size', hasSuffixIcon: false),
                SizedBox(
                  height: context.getHeight() * 0.04,
                ),
                const Text(
                  'Color',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: context.getHeight() * 0.04,
                ),
                Row(
                  children: [
                    SelectColorContainer(
                      color: Colors.red,
                      onTap: () {
                        selectedColor = Colors.red;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text(
                            'Color is selected',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: selectedColor,
                        ));
                      },
                    ),
                    SelectColorContainer(
                      color: Colors.blue,
                      onTap: () {
                        selectedColor = Colors.blue;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text(
                            'Color is selected',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: selectedColor,
                        ));
                      },
                    ),
                    SelectColorContainer(
                      color: Colors.green,
                      onTap: () {
                        selectedColor = Colors.green;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text(
                            'Color is selected',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: selectedColor,
                        ));
                      },
                    ),
                    SelectColorContainer(
                      color: Colors.amber,
                      onTap: () {
                        selectedColor = Colors.amber;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text(
                            'Color is selected',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: selectedColor,
                        ));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: context.getHeight() * 0.04,
                ),
                const CustomeTextButton(buttonText: 'Update')
              ],
            ),
          ),
        ),
      )),
    );
  }
}
