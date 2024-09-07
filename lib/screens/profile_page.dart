import 'package:flutter/material.dart';
import 'package:project6/components/custom_button.dart';

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
                  color: Color(0xffffffff),
                  border: Border.all(
                    color: Color(0xffB98875),
                    width: 2.0,
                  ),
                ),
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Color(0xffB98875),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                text: const TextSpan(
                  text: 'Welcome ',
                  style: TextStyle(fontSize: 30, color: Color(0xff000000)),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'User',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xffB98875))),
                  ],
                ),
              ),
              SizedBox(
                height: 180,
              ),
              CustomButton(
                text: 'Sign out',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
