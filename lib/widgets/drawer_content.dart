import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project6/data/users_layer.dart';
import 'package:project6/extensions/nav.dart';
import 'package:project6/models/user.dart';
import 'package:project6/screens/welcome_screen.dart';
import 'package:project6/widgets/button_widget.dart';

class DrawerContent extends StatelessWidget {
  final User user;
  const DrawerContent({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 150),
        Image.asset('assets/logo.png',width: 150),
        Text(
          'Hello, ${user.name}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700
          )
        ),
        Text(
          user.email,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300
          )
        ),
        Text(
          user.phone,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300
          )
        ),
        const SizedBox(height: 100),
        ButtonWidget(
          title: 'Sign Out',
          color: Colors.red,
          width: 200,
          onPressed: () {
            GetIt.I.get<UsersLayer>().signOut();
            context.pushReplacement(screen: const WelcomeScreen());
          }
        )
      ]
    );
  }
}