import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/img_ext.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import 'package:tickets_app/managers/user_mgr.dart';

class UserCard extends StatelessWidget {
  UserCard({
    super.key,
  });
  final userMgr = GetIt.I.get<UserMgr>();

  @override
  Widget build(BuildContext context) {
    final user = userMgr.allUsers.first;
    return Card(
      
      color: C.card,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: Img.person1,
          radius: 30,
        ),
        title: Text(user.name).styled(weight: FontWeight.bold, size: 20),
        subtitle: Text("${user.id} \nd${user.email}").styled(),
      ),
    );
  }
}
