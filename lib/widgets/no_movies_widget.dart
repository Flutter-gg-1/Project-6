import 'package:flutter/material.dart';

class NoMoviesWidget extends StatelessWidget {
  const NoMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No movies in this category",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
