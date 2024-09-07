import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tickets_app/managers/reservation_mgr.dart';
import 'package:tickets_app/screens/profile/profile_bloc.dart';
import 'package:tickets_app/utils/img_converter.dart';
import 'package:tickets_app/widget/Cards/reservation_card.dart';
import 'package:tickets_app/widget/Cards/user_card.dart';
import '../../core/all_file.dart';
import '../../core/extensions/img_ext.dart';
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
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<ProfileBloc>();
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
                  if (bloc.currentUser != null)
                    UserCard(
                        name: bloc.currentUser!.name,
                        email: bloc.currentUser!.email,
                        img: ImgConverter.imageFromBase64String(
                            bloc.currentUser!.avatarData))
                  else
                    const UserCard(
                        name: 'You are not Signed In',
                        email: '',
                        img: Image(image: Img.logo)),
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
                            onDelete: () {},
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
      }),
    );
  }
}
