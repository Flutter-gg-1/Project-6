import 'package:flutter/material.dart';
import 'package:project6/components/shimmer_custom.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xfffaf4ee),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShimmerCustom(width: 108),
              SizedBox(
                height: 6,
              ),
              ShimmerCustom(
                width: 320,
              ),
              SizedBox(
                height: 26,
              ),
              ShimmerCustom(width: 43),
              SizedBox(
                height: 20,
              ),
              ShimmerCustom(width: 160),
              SizedBox(
                height: 16,
              ),
              ShimmerCustom(width: 127),
              SizedBox(
                height: 6,
              ),
              ShimmerCustom(width: 194),
              SizedBox(
                height: 50,
              ),
              Center(child: ShimmerCustom(width: 206)),
            ],
          ),
        ),
      ),
    );
  }
}
