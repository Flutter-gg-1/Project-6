import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animations/animations.dart';
import 'package:project6/data_layer/coffee_data.dart';
import 'package:project6/screens/bloc/coffee_bloc.dart';
import 'package:project6/screens/bottom_nav_bar.dart';
import 'package:project6/screens/cart_page.dart';
import 'package:project6/screens/home_screen.dart';
import 'package:project6/screens/profile_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeBloc(),
      child: Builder(builder: (context) {
        int selectedIndex = 0;
        final List<Widget> _widgetOptions = <Widget>[
          const HomeScreen(),
          CartPage(),
          const ProfilePage(),
        ];
        return BlocBuilder<CoffeeBloc, CoffeeState>(
          builder: (context, state) {
            if (state is NavBarState) {
              selectedIndex = state.index;
            }
            return Scaffold(
              body: PageTransitionSwitcher(
                transitionBuilder: (widget, animation, secondaryAnimation) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: widget,
                  );
                },
                child: _widgetOptions[selectedIndex],
              ),
              bottomNavigationBar: const BottomNavBar(),
            );
          },
        );
      }),
    );
  }
}
