import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/widget/text_field/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Color(0xff18181B),
        ),
        actions: [
          CircleAvatar(
            child: Image.asset('assets/image/profile.png'),
          ),
          SizedBox(
            width: context.getWidth() / 20,
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Match Your Style',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 11,
              ),
              const SearchFeild(),
              const SizedBox(
                height: 12,
              ),
              ButtonsTabBar(
                buttonMargin: const EdgeInsets.only(left: 30),
                height: 35,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                unselectedLabelStyle:
                    const TextStyle(fontSize: 15, color: Color(0x37000000)),
                unselectedDecoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 222, 222),
                    borderRadius: BorderRadius.circular(18)),
                decoration: BoxDecoration(
                    color: const Color(0xffDC1F1F),
                    borderRadius: BorderRadius.circular(40)),
                tabs: const [
                  Tab(
                    child: Text(
                      'Trending Now',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'All',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'New',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const ItemCard(
                itemName: 'item one',
                price: '10.5',
              ),
            ],
          ),
        ),
      )),
    );
  }
}

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
