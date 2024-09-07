import 'package:flutter/material.dart';
import 'package:project6/components/text_widgets/text_custom.dart';

class BuyMore extends StatelessWidget {
  const BuyMore(
      {super.key,
      this.onTapIncrease,
      this.onTapDecrease,
      required this.amount,
      required this.price});
  final Function()? onTapIncrease;
  final Function()? onTapDecrease;
  final int amount;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCustom(
            title: '$price SAR',
            color: const Color(0xffB98875),
            weight: FontWeight.bold,
            size: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: onTapDecrease,
              child: Container(
                width: 35.11,
                height: 29,
                decoration: const BoxDecoration(
                    color: Color(0xffb98875),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
                child: const Center(
                  child: Icon(
                    Icons.remove,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: 33.58,
              height: 29,
              decoration: const BoxDecoration(color: Color(0xffD9D9D9)),
              child: Center(
                child: TextCustom(
                    title: amount.toString(),
                    color: Colors.black,
                    weight: FontWeight.w700,
                    size: 18),
              ),
            ),
            GestureDetector(
              onTap: onTapIncrease,
              child: Container(
                width: 35.11,
                height: 29,
                decoration: const BoxDecoration(
                    color: Color(0xffb98875),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
