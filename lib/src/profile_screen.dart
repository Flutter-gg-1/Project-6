import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/widget/button/button_text.dart';
import 'package:clothes_app/widget/card/profile_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.getWidth() * 0.1,
          vertical: context.getHeight() * 0.04),
      child: Center(
        child: Column(
          children: [
            const Text('My Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: context.getHeight() * 0.04,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    )),
              ),
              title: const Text(
                'Basel Saad',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('basel123@gmail.com'),
            ),
            SizedBox(
              height: context.getHeight() * 0.04,
            ),
            const ProfileCard(
              title: 'My order',
            ),
            const ProfileCard(
              title: 'My cards',
            ),
            const ProfileCard(
              title: 'Payment Method',
            ),
            const ProfileCard(
              title: 'My Reviews',
            ),
            const ProfileCard(
              title: 'My Address',
            ),
            const CustomeTextButton(buttonText: 'Logout')
          ],
        ),
      ),
    ));
  }
}