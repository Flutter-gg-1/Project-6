import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/img_ext.dart';
import 'package:tickets_app/widget/Cards/reservation_card.dart';
import 'package:tickets_app/widget/Cards/user_card.dart';
import '../core/all_file.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      appBar: AppBar(
        backgroundColor: C.bg,
        title: const Text("Profile").styled(size: 30, weight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              UserCard(),
              const SizedBox(
                height: 20,
              ),
              const Text("Reservations")
                  .styled(weight: FontWeight.bold, size: 25),
              ReservationCard(roomId: "1", nights: "2", date: "20")
            ],
          ),
        ),
      ),
    );
  }
}
