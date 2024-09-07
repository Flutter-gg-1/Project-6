import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import 'package:tickets_app/managers/user_mgr.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String img;
  UserCard({
    super.key, required this.name, required this.email, required this.img,
  });
  final userMgr = GetIt.I.get<UserMgr>();

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
          backgroundImage:img as ImageProvider ,
          radius: 30,
        ),
        title: Text(name).styled(weight: FontWeight.bold, size: 20),
        subtitle: Text(email).styled(),
      ),
    );
  }
}

