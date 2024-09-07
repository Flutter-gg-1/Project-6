import 'package:flutter/material.dart';
import 'package:project6/components/custom_button.dart';
import 'package:project6/data_layer/coffee_data.dart';
import 'package:project6/screens/login_screen.dart';
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
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffffffff),
                  border: Border.all(
                    color: const Color(0xffB98875),
                    width: 2.0,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  size: 100,
                  color: Color(0xffB98875),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  text: 'Welcome ',
                  style: const TextStyle(fontSize: 30, color: Color(0xff000000)),
                  children: <TextSpan>[
                    TextSpan(
                        text: getIt.get<CoffeeData>().currentUser['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xffB98875))),
                  ],
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              CustomButton(
                text: 'Sign out',
                onPressed: () {
                  getIt.get<CoffeeData>().currentUser = {};
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
