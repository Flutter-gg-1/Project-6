import 'package:flutter/material.dart';

class ImageFieldWidget extends StatelessWidget {
  const ImageFieldWidget({super.key, this.onSelect});

  final Function()? onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Add poster",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        const SizedBox(height: 15),
        InkWell(
            onTap: onSelect,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 0.5,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                    color: Color(0xff383740),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Icon(Icons.add, size: 100, color: Colors.white))),
      ],
    );
  }
}
