import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project6/screens/cart_page.dart';
import 'package:project6/screens/home_screen.dart';
import 'package:project6/screens/profile_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
     HomeScreen(),
     CartPage(),
     ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavBar(
          selectedIndex: selectedIndex, onItemTapped: onItemTapped),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/home.svg',
            color: selectedIndex == 0
                ? const Color(0xff58352E)
                : const Color(0xffADA3A1),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/cart.svg',
            color: selectedIndex == 1
                ? const Color(0xff58352E)
                : const Color(0xffADA3A1),
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/profile.svg',
            color: selectedIndex == 2
                ? const Color(0xff58352E)
                : const Color(0xffADA3A1),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color(0xff58352E),
      unselectedItemColor: const Color(0xffADA3A1),
      onTap: onItemTapped,
    );
  }
}
