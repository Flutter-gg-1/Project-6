import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import 'package:tickets_app/reusable_components/custom_text_btn.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final Image img;
  final Function() onLogout;
  final String btnTitle;
  const UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.img,
    required this.onLogout,
    this.btnTitle = 'Logout',
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: C.card,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: img.image,
                  radius: 30,
                ),
                title: Text(name).styled(weight: FontWeight.bold, size: 20),
                subtitle: Text(email).styled(),
              ),
            ),
            Expanded(
                child:
                    CustomTextBtn(title: btnTitle, callback: () => onLogout()))
          ],
        ),
      ),
    );
  }
}
