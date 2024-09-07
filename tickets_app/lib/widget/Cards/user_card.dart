import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import 'package:tickets_app/widget/my_button.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final Image img;
  final Function()? onLogout;
  const UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.img, this.onLogout,

  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: C.card,
      elevation: 8,
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: img.image,
              radius: 30,
            ),
            title: Text(name).styled(weight: FontWeight.bold, size: 20),
            subtitle: Text(email).styled(),
          ),
          SizedBox(
            width: 150,
            child: MyButton(text: 'Logout', onPressed: onLogout)),
        ],
      ),
    );
  }
}
