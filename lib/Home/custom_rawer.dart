import 'package:flutter/material.dart';
import 'package:project6/theme/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("john.doe@example.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person, size: 50, color: Colors.white),
              backgroundColor: Colors.blueGrey,
            ),
            decoration: BoxDecoration(color: AppColors.lighthread),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blueGrey),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.blueGrey),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
