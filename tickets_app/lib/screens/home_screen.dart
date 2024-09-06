import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/get_size.dart';
import 'package:tickets_app/core/extensions/img_ext.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import 'package:tickets_app/screens/profile_screen.dart';
import 'package:tickets_app/screens/reservations_screen.dart';
import 'package:tickets_app/widget/Cards/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToReservations(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ReservationsScreen()));
  }

  void _navigateToProfile(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      appBar: AppBar(
        backgroundColor: C.bg,
        leading: IconButton(
            onPressed: () => _navigateToReservations(context),
            icon: Icon(Icons.hotel)),
        title: Text("Home")
            .styled(color: C.black, size: 30, weight: FontWeight.bold),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => _navigateToProfile(context),
            borderRadius: BorderRadius.circular(30),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: Img.person1,
            ),
          ),
          SizedBox(
            width: context.getScreenSize(multiplyWidth: 0.05),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: HomeCard(
                    title: "title",
                    subTitle: "subTitle",
                    price: "price",
                    rate: 4.5,
                    image: Img.room1,
                    onPressed: () {}))
          ],
        ),
      ),
    );
  }
}
