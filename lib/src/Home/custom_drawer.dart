import 'package:flutter/material.dart';
import 'package:project6/blocs/home_bloc/home_bloc.dart';
import 'package:project6/src/Home/profile/profile.dart';
import 'package:project6/src/Login/login.dart';
import 'package:project6/theme/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  final HomeBloc homeBloc;

  const CustomDrawer({super.key, required this.homeBloc});

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
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            decoration: BoxDecoration(color: AppColors.lighthread),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blueGrey),
            title: const Text('Profile'),
            onTap: () async {
              final deletedRecipe = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
              if (deletedRecipe != null) {
                homeBloc.add(RemoveRecipeEvent(deletedRecipe));
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.blueGrey),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(), 
                ),
                (route) => false, 
              );
            },
          ),
        ],
      ),
    );
  }
}
