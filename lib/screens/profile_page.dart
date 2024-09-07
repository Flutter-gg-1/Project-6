import 'package:flutter/material.dart';
import 'package:project6/data_layer/coffee_data.dart';
import 'package:project6/setup/init.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          child: Column(
            children: [
              const Image(image: AssetImage('assets/images/profile.png')),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  text: 'Welcome ',
                  style: TextStyle(fontSize: 30, color: Color(0xff000000)),
                  children: <TextSpan>[
                    TextSpan(
                        text: getIt.get<CoffeeData>().currentUser['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xffB98875))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
