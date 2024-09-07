import 'package:flutter/material.dart';

class CoffeeMenue extends StatelessWidget {
  const CoffeeMenue(
      {super.key,
      required this.coffee,
      required this.coffeeImg,
      this.onPressed});

  final String coffee;
  final String coffeeImg;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image(
              image: AssetImage(coffeeImg),
            ),
          ),
          const SizedBox(
            width: 60,
          ),
          Text(
            coffee,
            style: const TextStyle(fontSize: 19),
          ),
          const Spacer(),
          IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color(0xffB98875),
              ))
        ],
      ),
    );
  }
}
