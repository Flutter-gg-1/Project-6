import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickets_app/screens/add_reservation/add_reservation_screen.dart';
import 'package:tickets_app/screens/login/login_screen.dart';
import 'package:tickets_app/screens/profile/profile_bloc.dart';
import 'package:tickets_app/utils/img_converter.dart';
import 'package:tickets_app/reusable_components/cards/reservation_card.dart';
import 'package:tickets_app/reusable_components/cards/user_card.dart';
import '../../core/all_file.dart';
import '../../core/extensions/img_ext.dart';
import '../../model/reservation.dart';
import '../../model/room.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _navigateToEdit({
    required BuildContext context,
    required Room room,
    required Reservation reservation,
  }) {
    Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (context) =>
          AddReservationScreen(room: room, reservation: reservation),
    ))
        .then((result) {
      if (context.mounted) {
        context.read<ProfileBloc>().add(UpdateResListEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child:
          BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
        if (state is RemoveResState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reservation removed')),
          );
        } else if (state is SignOutState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        }
      }, builder: (context, state) {
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
                        bloc.currentUser!.avatarData,
                      ),
                      onLogout: () {
                        context.read<ProfileBloc>().add(SignOutEvent());
                      },
                    )
                  else
                    UserCard(
                      name: 'You are not Signed In',
                      email: '',
                      img: const Image(image: Img.logo),
                      btnTitle: 'Sign In',
                      onLogout: () {
                        context.read<ProfileBloc>().add(SignOutEvent());
                      },
                    ),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Reservations")
                                .styled(size: 18, weight: FontWeight.w600),
                            ...bloc.userReservations().map(
                                  (res) => ReservationCard(
                                    roomId: res.roomId,
                                    nights: '${res.numNights}',
                                    date: res.date,
                                    img: ImgConverter.imageFromBase64String(bloc
                                        .getSelectedRoom(res.roomId)
                                        .imgData),
                                    onPressed: () => _navigateToEdit(
                                      context: context,
                                      room: bloc.getSelectedRoom(res.roomId),
                                      reservation: res,
                                    ),
                                    onDelete: () {
                                      context.read<ProfileBloc>().add(
                                          RemoveResEvent(
                                              reservationId: res.id));
                                    },
                                  ),
                                ),
                          ],
                        ),
                      );
                    },
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
