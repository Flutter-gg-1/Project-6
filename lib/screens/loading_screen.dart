import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf4ee),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Image.asset("assets/images/Asset 3 1.png"),
              Image.asset("assets/images/Asset 3 2.png"),
              Expanded(child: Image.asset("assets/images/Asset 3 3.png")),
            ],
          ),
          Positioned(
              child: Lottie.asset("assets/images/Animation - 1725560548857.json")),
        ],
      ),
    );
  }
}
