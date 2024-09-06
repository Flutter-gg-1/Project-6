import 'package:clothes_app/helper/extenstios/screen.dart';
import 'package:clothes_app/widget/button/button_text.dart';
import 'package:clothes_app/widget/text_field/custome_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                'Welcome',
                style: TextStyle(
                    fontFamily: 'Romanesco',
                    fontSize: 35,
                    color: Color(0xff5F3636)),
              ),
            ],
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
            hasSuffixIcon: false,
            hintText: 'Email',
          ),
          SizedBox(
            height: context.getHeight() / 19,
          ),
          const CustomTextField(
            hasSuffixIcon: true,
            hintText: 'Password',
          ),
          SizedBox(
            height: context.getHeight() / 19,
          ),
          const CustomTextField(
            hasSuffixIcon: true,
            hintText: 'Confirm Password',
          ),
          SizedBox(
            height: context.getWidth() / 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: context.getWidth() / 3.08,
                height: 2,
                color: const Color(0xff5F3636),
              ),
              //############mediaQ
              const SizedBox(
                width: 15,
              ),
              Container(
                height: context.getHeight() / 25,
                width: context.getWidth() / 15,
                decoration: BoxDecoration(
                    color: const Color(0xffC0A286).withOpacity(0.20),
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 2.5, color: const Color(0xff5F3636))),
                child: const Center(
                  child: Text(
                    'OR',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff5F3636)),
                  ),
                ),
              ),
              //#########mediaQ
              const SizedBox(
                width: 15,
              ),
              Container(
                width: context.getWidth() / 3.08,
                height: 2,
                color: const Color(0xff5F3636),
              ),
            ],
          ),
          SizedBox(
            height: context.getWidth() / 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.facebook,
                size: 40,
                color: const Color(0xff5F3636).withOpacity(0.73),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: context.getWidth() / 14,
                    right: context.getWidth() / 14),
                child: Icon(
                  Icons.g_mobiledata_outlined,
                  size: 60,
                  color: const Color(0xff5F3636).withOpacity(0.73),
                ),
              ),
              Icon(
                Icons.wechat_sharp,
                size: 40,
                color: const Color(0xff5F3636).withOpacity(0.73),
              )
            ],
          ),
          SizedBox(
            height: context.getWidth() / 12,
          ),
          const CustomeTextButton(
            buttonText: 'Sign Up',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already Have an account ?',
                style:
                    TextStyle(color: const Color(0xff5F3636).withOpacity(0.48)),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Login',
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
