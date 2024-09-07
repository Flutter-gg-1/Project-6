import 'package:flutter/material.dart';
import 'package:project6/screens/login_screen.dart';
import 'package:project6/screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/artwork 1.png",
                fit: BoxFit.cover,
              )),
          const Text(
            "Get the best coffee\n In town!",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: const ButtonStyle(
                      foregroundColor:
                          WidgetStatePropertyAll(Color(0xffFFFFFF)),
                      minimumSize: WidgetStatePropertyAll(Size(150, 50)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: Color(0xffB98875)),
                          borderRadius: BorderRadius.all(Radius.circular(24)))),
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xffB98875))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  style: const ButtonStyle(
                      foregroundColor:
                          WidgetStatePropertyAll(Color(0xffB98875)),
                      minimumSize: WidgetStatePropertyAll(Size(150, 50)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: Color(0xffB98875)),
                          borderRadius: BorderRadius.all(Radius.circular(24)))),
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xffFFFFFF))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
          ElevatedButton(
              style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Color(0xff3D6AD6)),
                  minimumSize: WidgetStatePropertyAll(Size(130, 50)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(24)))),
                  backgroundColor: WidgetStatePropertyAll(Color(0xffFFFFFF))),
              onPressed: () {},
              child: SizedBox(
                height: 50,
                width: 290,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/facebook.png"),
                    const Text(
                      "Connect with facebook",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
