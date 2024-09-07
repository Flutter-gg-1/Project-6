import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project6/screens/bloc/coffee_bloc.dart';
import 'package:project6/screens/nav_bar.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeBloc()..add(LoadingScreenEvent()),
      child: BlocConsumer<CoffeeBloc, CoffeeState>(
        listener: (context, state) {
          if (state is SuccessNavgationState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavBar()),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingScreenState) {
            return Scaffold(
              backgroundColor: const Color(0xfffaf4ee),
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/images/Asset 3 1.png"),
                      Image.asset("assets/images/Asset 3 2.png"),
                      Expanded(child: Image.asset("assets/images/Asset 3 3.png")),
                    ],
                  ),
                  Positioned(
                    child: Lottie.asset("assets/images/Animation - 1725560548857.json"),
                  ),
                ],
              ),
            );
          }

          return const Scaffold(
            body: Center(child: Text('Unexpected state')),
          );
        },
      ),
    );
  }
}
