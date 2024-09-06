
import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/widget/button/button_text.dart';
import 'package:clothes_app/widget/text_field/custome_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: context.getHeight() / 40,
          ),
          Row(
            children: [
              SizedBox(width: context.getWidth() / 8),
              const Text(
                'Welcome back',
                style: TextStyle(
                    fontFamily: 'Romanesco',
                    fontSize: 35,
                    color: Color(0xff5F3636)),
              ),
            ],
          ),
          SizedBox(
            height: context.getHeight() / 15,
          ),
          Center(
            child: Image.asset("assets/undraw_jewelry_iima 1.png"),
          ),
          SizedBox(
            height: context.getHeight() / 35,
          ),
          const CustomTextField(
            hasSuffixIcon: false,
            hintText: 'User Name',
          ),
          SizedBox(
            height: context.getHeight() / 19,
          ),
          const CustomTextField(
            hasSuffixIcon: true,
            hintText: 'Password',
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password ?',
                      style: TextStyle(
                          fontFamily: 'Romanesco',
                          fontSize: 16,
                          color: const Color(0xff5F3636).withOpacity(0.48)),
                    )),
                SizedBox(
                  width: context.getWidth() / 13,
                )
              ],
            ),
          ),
          SizedBox(
            height: context.getWidth() / 12,
          ),
          const CustomeTextButton(
            buttonText: 'Login',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account ?',
                style:
                    TextStyle(color: const Color(0xff5F3636).withOpacity(0.48)),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'SignUp',
                    style: TextStyle(
                        color: Color(0xff5F3636), fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      )),
    );
  }
}
