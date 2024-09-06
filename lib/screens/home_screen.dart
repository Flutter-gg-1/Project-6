import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF4EE),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAF4EE),
        actions: const [Icon(Icons.search)],
      ),
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
                        text: 'Day For Coffee',
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
                coffee: 'cappuccino',
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

class CoffeeMenue extends StatelessWidget {
  const CoffeeMenue({super.key, required this.coffee, required this.coffeeImg});

  final String coffee;
  final String coffeeImg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        children: [
          Image(
            image: AssetImage(coffeeImg),
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
              onPressed: () {
                //navigate to coffee info screen
              },
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color(0xffB98875),
              ))
        ],
      ),
    );
  }
}
