import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/core/extensions/color_ext.dart';
import 'package:tickets_app/core/extensions/img_ext.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import 'package:tickets_app/managers/room_mgr.dart';
import 'package:tickets_app/managers/user_mgr.dart';
import 'package:tickets_app/screens/profile/profile_screen.dart';
import 'package:tickets_app/utils/img_converter.dart';
import '../model/room.dart';
import '../reusable_components/cards/room_card.dart';
import 'add_reservation/add_reservation_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final userMgr = GetIt.I.get<UserMgr>();
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
        title: const Text("Home")
            .styled(color: C.black, size: 24, weight: FontWeight.bold),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: InkWell(
              onTap: () => _navigateToProfile(context),
              borderRadius: BorderRadius.circular(20),
              child: const CircleAvatar(
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    const Text('Room Selection')
                        .styled(size: 18, weight: FontWeight.w600)
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                    children: roomMgr.allRooms
                        .map((room) => RoomCard(
                              title: room.title,
                              subTitle: room.description,
                              price: '${room.price}',
                              rating: room.rating,
                              image: ImgConverter.imageFromBase64String(
                                  room.imgData),
                              onPressed: () => userMgr.currentUser == null
                                  ? _navigateToProfile(context)
                                  : _navigateToAddRoom(context, room),
                            ))
                        .toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
