import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/managers/reservation_mgr.dart';
import 'package:tickets_app/widget/Cards/reservation_card.dart';
import 'package:tickets_app/widget/Cards/user_card.dart';
import '../../core/all_file.dart';
import '../edit_reservation/edit_reservation_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final resMgr = GetIt.I.get<ReservationMgr>();

  void _navigateToEdit(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const EditReservationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      appBar: AppBar(
          backgroundColor: C.bg,
          title: const Text("Profile")
              .styled(color: C.black, size: 24, weight: FontWeight.bold),
          centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              UserCard(),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Reservations")
                        .styled(size: 18, weight: FontWeight.w600),
                    ...resMgr.allReservations.map(
                      (res) => ReservationCard(
                        roomId: '${res.roomId}',
                        nights: '${res.numNights}',
                        date: res.date,
                        onPressed: () => _navigateToEdit(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
