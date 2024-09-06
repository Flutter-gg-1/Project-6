
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String itemName, price;
  const ItemCard({
    super.key,
    required this.itemName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: context.getWidth() * 0.35,
        height: context.getHeight() * 0.25,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/image/card_image1.png',
                  height: context.getHeight() * 0.18,
                  width: context.getWidth() * 0.35,
                ),
                Positioned(
                  left: (context.getWidth() * 0.35) / 1.7,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                    color: const Color.fromARGB(255, 207, 55, 55),
                  ),
                )
              ],
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: const TextStyle(
                      color: Color(0x34000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text('$price Rs',
                    style: const TextStyle(
                        color: Color(0x34000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 15))
              ],
            )
          ],
        ),
      ),
    );
  }
}