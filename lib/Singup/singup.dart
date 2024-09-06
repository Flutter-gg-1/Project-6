import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project6/Singup/SignUpForm.dart';
import 'package:project6/theme/app_colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
                    'Create Account',
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
                  child: const SignUpForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
