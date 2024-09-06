import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/get_size.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';

class RateWidget extends StatelessWidget {
  final double rating;
  const RateWidget({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: C.accent),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.star,
              color: Colors.white,
              size: 16,
            ),
            Text("$rating").styled(
                color: Colors.white,
                weight: FontWeight.w600,
                align: TextAlign.left)
          ],
        ),
      ),
    );
  }
}
