import 'package:clothes_app/helper/extinsion/size_config.dart';
import 'package:clothes_app/widget/card/landing_card.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: context.getHeight() / 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 11),
              child: const Column(
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(color: Colors.black, fontSize: 34),
                  ),
                  Text(
                    'Amanda',
                    style: TextStyle(
                        color: Color(0xffFFC74A),
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: context.getHeight() / 13),
          CustomeLandScreenCard(
            heightCard: context.getHeight() / 6,
            imgCard: 'assets/image/image 19.png',
            colorCard: 0xffFFF3E7,
            textCard: 'Summer\nCollections',
          ),
          SizedBox(height: context.getHeight() / 16),
          CustomeLandScreenCard(
            heightCard: context.getHeight() / 6,
            imgCard: 'assets/image/image 22.png',
            colorCard: 0xffFCDFEA,
            textCard: 'Winter\nCollections',
          ),
          SizedBox(height: context.getHeight() / 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 13),
              child: const Text(
                'Offers',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: context.getHeight() / 40),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  //navigator
                  onTap: () {},
                  child: Container(
                    width: context.getWidth() / 1.2,
                    height: context.getHeight() / 6,
                    decoration: BoxDecoration(
                        color: const Color(0xffEAF0FF),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 10,
                          right: MediaQuery.of(context).size.width / 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/image/image 21.png'),
                          const Row(
                            children: [
                              Text(
                                'Get ',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Sen'),
                              ),
                              Text(
                                '30%  ',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff6B63DD),
                                    fontFamily: 'Sen'),
                              ),
                              Text(
                                'Off',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Sen'),
                              ),
                            ],
                          ),

                          //6B63DD
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
