import 'dart:io';

import 'package:flutter/material.dart';

class ImageFieldWidget extends StatelessWidget {
  final String? imagePath;
  final Function()? onSelect;
  const ImageFieldWidget({super.key, this.onSelect, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: onSelect,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 0.5,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                    color: Color(0xff383740),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                // child: const Icon(Icons.add, size: 100, color: Colors.white)
                child: imagePath!.contains('assets') ? Image.asset(imagePath!)
                : Image.file(File(imagePath!)),
              )
            );
  }
}
