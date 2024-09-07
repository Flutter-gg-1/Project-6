import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project6/data_layer/data/coffee_data.dart';
import 'package:project6/screens/bloc/coffee_bloc.dart';
import 'package:project6/setup/init.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        if (state is NavBarState) {
          selectedIndex = state.index;
        }
        return BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/home.svg',
                colorFilter: selectedIndex == 0
                    ? const ColorFilter.mode(Color(0xff58352E), BlendMode.srcIn)
                    : const ColorFilter.mode(
                        Color(0xffADA3A1), BlendMode.srcIn),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                offset: const Offset(4, 4),
                label: getIt.get<CoffeeData>().dataLayer.isEmpty
                    ? const SizedBox()
                    : Text(getIt.get<CoffeeData>().dataLayer.length.toString()),
                backgroundColor: getIt.get<CoffeeData>().dataLayer.isEmpty
                    ? Colors.transparent
                    : const Color(0xffb98875),
                child: SvgPicture.asset(
                  'assets/svg/cart.svg',
                  colorFilter: selectedIndex == 1
                      ? const ColorFilter.mode(
                          Color(0xff58352E), BlendMode.srcIn)
                      : const ColorFilter.mode(
                          Color(0xffADA3A1), BlendMode.srcIn),
                ),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/profile.svg',
                colorFilter: selectedIndex == 2
                    ? const ColorFilter.mode(Color(0xff58352E), BlendMode.srcIn)
                    : const ColorFilter.mode(
                        Color(0xffADA3A1), BlendMode.srcIn),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: const Color(0xff58352E),
          unselectedItemColor: const Color(0xffADA3A1),
          onTap: (index) {
            context.read<CoffeeBloc>().add(NavBarEvent(index: index));
          },
        );
      },
    );
  }
}
