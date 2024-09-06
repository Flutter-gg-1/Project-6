import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/img_ext.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import 'package:tickets_app/managers/room_mgr.dart';
import 'package:tickets_app/screens/profile_screen.dart';
import 'package:tickets_app/utils/img_converter.dart';
import 'package:tickets_app/widget/Cards/home_card.dart';
import '../model/room.dart';
import 'add_reservation/add_reservation_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final roomMgr = GetIt.I.get<RoomMgr>();

  void _navigateToProfile(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
  }

  void _navigateToAddRoom(BuildContext context, Room room) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddReservationScreen(room: room)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      appBar: AppBar(
        backgroundColor: C.bg,
        title: Text("Home")
            .styled(color: C.black, size: 24, weight: FontWeight.bold),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: InkWell(
              onTap: () => _navigateToProfile(context),
              borderRadius: BorderRadius.circular(20),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: Img.person1,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
              children: roomMgr.allRooms
                  .map((room) => HomeCard(
                        title: room.title,
                        subTitle: room.description,
                        price: '${room.price}',
                        rating: 4.5,
                        image: ImgConverter.imageFromBase64String(room.imgData),
                        onPressed: () => _navigateToAddRoom(context, room),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
