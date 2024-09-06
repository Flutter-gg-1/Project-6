import 'package:clothes_app/src/add_item_screen.dart';
import 'package:clothes_app/src/item_screen.dart';
import 'package:clothes_app/src/profile_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> tabs = const [ItemScreen(), AddItemScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FlashyTabBar(
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        selectedIndex: _selectedIndex,
        items: [
          FlashyTabBarItem(
            icon: const Icon(
              Iconsax.home_bold,
              color: Color.fromARGB(255, 214, 169, 100),
              size: 30,
            ),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Iconsax.card_add_bold,
              color: Color.fromARGB(122, 18, 140, 156),
              size: 30,
            ),
            title: const Text('Add'),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Iconsax.profile_2user_bold,
              color: Colors.blueGrey,
              size: 30,
            ),
            title: const Text('Profile'),
          ),
        ],
      ),
      body: tabs[_selectedIndex],
    );
  }
}
