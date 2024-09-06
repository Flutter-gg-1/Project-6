import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project6/data/movies_layer.dart';

class CatgoriesWidget extends StatelessWidget {
  final Function(String) radioButtonValue;
  const CatgoriesWidget({super.key,required this.radioButtonValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Category",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white
          )
        ),
        const SizedBox(height: 15),
        CustomRadioButton(
          buttonLables: GetIt.I.get<MoviesLayer>().categories,
          buttonValues: GetIt.I.get<MoviesLayer>().categories,
          enableShape: true,
          radioButtonValue: radioButtonValue,
          radius: 10,
          selectedBorderColor: const Color(0xff6F43F5),
          unSelectedBorderColor: Colors.white,
          selectedColor: Colors.transparent,
          unSelectedColor: Colors.transparent,
          height: 44,
          width: 109,
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          absoluteZeroSpacing: true,
          buttonTextStyle: const ButtonTextStyle(
            selectedColor: Color(0xff6F43F5),
            unSelectedColor: Colors.white,
            textStyle: TextStyle(fontSize: 16)
          ),
        ),
      ],
    );
  }
}