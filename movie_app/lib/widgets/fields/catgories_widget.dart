import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

class CatgoriesWidget extends StatelessWidget {
  const CatgoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Catgoray",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        const SizedBox(height: 15),
        CustomRadioButton(
            enableShape: true,
            selectedBorderColor: const Color(0xff6F43F5),
            unSelectedBorderColor: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 44,
            width: 109,
            elevation: 0,
            absoluteZeroSpacing: true,
            unSelectedColor: Colors.transparent,
            buttonLables: const [
              'Comady',
              'Drama',
              'Romance',
              'Action',
              'Horror',
              'Family',
            ],
            buttonValues: const [
              'Comady',
              'Drama',
              'romance',
              'Action',
              'Horror',
              'Family',
            ],
            buttonTextStyle: const ButtonTextStyle(
                selectedColor: Color(0xff6F43F5),
                unSelectedColor: Colors.white,
                textStyle: TextStyle(fontSize: 16)),
            radioButtonValue: (value) {},
            radius: 10,
            selectedColor: Colors.transparent),
      ],
    );
  }
}
