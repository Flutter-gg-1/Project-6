import 'package:flutter/material.dart';
import 'package:project6/custom_widgets/coffee_menu.dart';

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
              const CoffeeMenue(
                coffee: 'Espresso',
                coffeeImg: 'assets/images/Espresso.png',
              ),
              const CoffeeMenue(
                coffee: 'Cappuccino',
                coffeeImg: 'assets/images/Cappuccino.png',
              ),
              const CoffeeMenue(
                coffee: 'Macchiato',
                coffeeImg: 'assets/images/Macciato.png',
              ),
              const CoffeeMenue(
                coffee: 'Mocha',
                coffeeImg: 'assets/images/Mocha.png',
              ),
              const CoffeeMenue(
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
