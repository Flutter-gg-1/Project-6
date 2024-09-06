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
            child: Image.asset('assets/profile.png'),
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
              Container(
                width: context.getWidth() * 0.35,
                height: context.getHeight() * 0.22,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  children: [
                    Image.asset('assets/image/profile.png'),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Item name'),
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
