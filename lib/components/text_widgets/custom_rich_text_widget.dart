import 'package:flutter/material.dart';

class CustomRichTextWidget extends StatelessWidget {
  const CustomRichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: "It’s Great",
                        style: TextStyle(color: Colors.black, fontSize: 30)),
                    TextSpan(
                        text: " Day For\nCoffee",
                        style: TextStyle(
                            color: Color(0xffB98875),
                            fontSize: 30,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              );
  }
}