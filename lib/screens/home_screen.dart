import 'package:flutter/material.dart';
import 'package:project6/custom_widgets/coffee_menu.dart';
import 'package:project6/screens/add_coffe_screen.dart';

import '../components/custom_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });
  // home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF4EE),
      appBar: const CustomAppBarWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              RichText(
                text: const TextSpan(
                  text: 'It’s Great ',
                  style: TextStyle(fontSize: 30, color: Color(0xff000000)),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Day For\nCoffee',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xffB98875))),
                  ],
                ),
              ),
              CoffeeMenue(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AddCoffeScreen(price: 19,
                              image: "assets/images/Espresso.png")));
                },
                coffee: 'Espresso',
                coffeeImg: 'assets/images/Espresso.png',
              ),
              CoffeeMenue(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AddCoffeScreen(price: 23,
                              image: "assets/images/Cappuccino.png")));
                },
                coffee: 'Cappuccino',
                coffeeImg: 'assets/images/Cappuccino.png',
              ),
              CoffeeMenue(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AddCoffeScreen(price: 12,
                              image: "assets/images/Macciato.png")));
                },
                coffee: 'Macchiato',
                coffeeImg: 'assets/images/Macciato.png',
              ),
              CoffeeMenue(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AddCoffeScreen(price: 16,
                              image: "assets/images/Mocha.png")));
                },
                coffee: 'Mocha',
                coffeeImg: 'assets/images/Mocha.png',
              ),
              CoffeeMenue(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AddCoffeScreen(price: 17,
                              image: "assets/images/Latte.png")));
                },
                coffee: 'Latte',
                coffeeImg: 'assets/images/Latte.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
