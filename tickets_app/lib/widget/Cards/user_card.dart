import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final ImageProvider img;
  const UserCard({
    super.key, required this.name, required this.email, required this.img,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: C.card,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage:img  ,
          radius: 30,
        ),
        title: Text(name).styled(weight: FontWeight.bold, size: 20),
        subtitle: Text(email).styled(),
      ),
    );
  }
}

