import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project6/src/Login/login_form.dart';
import 'package:project6/theme/app_colors.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: Container(
                height: screenSize.height * 0.45,
                width: screenSize.width,
                // color: AppColors.primaryColor,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.lighthread,
                      AppColors.darkread,
                    ],
                  ),
                ),
              ),
            ),
          ),
          // المحتوى فوق الخلفية المنحنية
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      AppColors.lighthread,
                      AppColors.darkread,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    'Welcome back',
                    style: GoogleFonts.lora(
                      fontSize: 30,
                      color: Colors
                          .white, // The color is ignored due to the ShaderMask
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.08,
                ),
                SizedBox(
                  width: screenSize.width * 0.8,
                  child: const LoginForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}