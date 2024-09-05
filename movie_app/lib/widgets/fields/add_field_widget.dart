import 'package:flutter/material.dart';

class AddFieldWidget extends StatelessWidget {
  const AddFieldWidget({super.key, required this.label, required this.hint});
  final String label;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        const SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width / 0.5,
          child: TextField(
            decoration: InputDecoration(
                hintStyle:
                    const TextStyle(color: Color.fromARGB(152, 255, 255, 255)),
                hintText: hint,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                filled: true,
                fillColor: const Color(0xff383740)),
          ),
        )
      ],
    );
  }
}
