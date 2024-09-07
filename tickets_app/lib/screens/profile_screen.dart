

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/managers/reservation_mgr.dart';
import 'package:tickets_app/managers/user_mgr.dart';
import 'package:tickets_app/screens/edit_reservation/edit_reservation_screen.dart';
import 'package:tickets_app/widget/Cards/reservation_card.dart';
import 'package:tickets_app/widget/Cards/user_card.dart';
import '../core/all_file.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  final userMgr = GetIt.I.get<UserMgr>();

  final reservationMgr = GetIt.I.get<ReservationMgr>();

  void _navigateToEdit(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const EditReservationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    userMgr.currentUser?.id = 0;
    return Scaffold(
      backgroundColor: C.bg,
      appBar: AppBar(
        backgroundColor: C.bg,
        title: const Text("Profile").styled(size: 30, weight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: userMgr.currentUser?.id != null
                ? ListView(
                    children: [
                      UserCard(
                        name: userMgr.currentUser!.name,
                        email: userMgr.currentUser!.email,
                        img: userMgr.currentUser!.avatarData,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Reservations")
                          .styled(weight: FontWeight.bold, size: 25),
                      ReservationCard(
                        roomId: "1",
                        nights: "2",
                        date: "20",
                        onPressed: () => _navigateToEdit(context),
                      )
                      /*
                      :const Text("please Login first")
                                .styled(size: 20, weight: FontWeight.w600, color: C.text2 ),
                       */
                    ],
                  )
                : Center(
                    child: Container(
                        height: 250,
                        width: 300,
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: C.lithGray,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("please Login first")
                                .styled(size: 20, weight: FontWeight.w600),
                            const SizedBox(
                              height: 10,
                            ),
                            MyButton(text: 'Log in', onPressed: () {}),
                          ],
                        )),
                  )),
      ),
    );
  }
}

