import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerCustom extends StatelessWidget {
  const ShimmerCustom({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 1),
      color: Colors.grey.shade300,
      child: Container(
        width: width,
        height: 31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 20,
              offset: Offset(0, -1),
              spreadRadius: 1,
            )
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffFFFFFF), Color.fromARGB(255, 182, 182, 182)],
          ),
        ),
      ),
    );
  }
}
