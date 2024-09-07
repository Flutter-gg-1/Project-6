import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/img_ext.dart';
import 'package:tickets_app/screens/home_screen.dart';
import 'package:tickets_app/screens/login/login_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../managers/user_mgr.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final userMgr = GetIt.I.get<UserMgr>();

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Image(image: Img.logo2),
      nextScreen: (userMgr.currentUser == null) ? LoginScreen() : HomeScreen(),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      backgroundColor: C.bg,
      duration: 3000,
    );
  }
}
