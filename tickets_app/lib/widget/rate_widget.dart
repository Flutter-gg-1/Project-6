import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/get_size.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';

class RateWidget extends StatelessWidget {
  final double rate;
  const RateWidget({
    super.key,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getScreenSize(multiplyWidth: 0.16),
      height: context.getScreenSize(multiplyWidth: 0.07),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: C.accent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.star,
            color: C.text1,
          ),
          Text("$rate").styled(
              color: C.text1, weight: FontWeight.w600, align: TextAlign.left)
        ],
      ),
    );
  }
}
