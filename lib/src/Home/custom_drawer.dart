import 'package:flutter/material.dart';
import 'package:project6/blocs/home_bloc/home_bloc.dart';
import 'package:project6/models/user.dart';
import 'package:project6/src/profile/profile.dart';
import 'package:project6/src/Login/login.dart';
import 'package:project6/theme/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  final User user;
  final HomeBloc homeBloc;

  const CustomDrawer({super.key, required this.user, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.username),
            accountEmail: Text(user.email),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              backgroundImage: AssetImage(
                  'asstes/chef-restaurant-vector-kitchen-cook-hat-food-professional-icon-symbol-illustration-sign_1013341-148802.avif'),
            ),
            decoration: const BoxDecoration(color: AppColors.lighthread),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blueGrey),
            title: const Text('Profile'),
            onTap: () async {
              final deletedRecipe = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    user: user,
                  ),
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
