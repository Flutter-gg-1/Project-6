import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickets_app/screens/login/login_screen.dart';
import 'package:tickets_app/screens/profile/profile_bloc.dart';
import 'package:tickets_app/utils/img_converter.dart';
import 'package:tickets_app/widget/Cards/reservation_card.dart';
import 'package:tickets_app/widget/Cards/user_card.dart';
import '../../core/all_file.dart';
import '../../core/extensions/img_ext.dart';
import '../edit_reservation/edit_reservation_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _navigateToEdit(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const EditReservationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child:
          BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
        if (state is RemoveResState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Reservation removed')),
          );
        } else if (state is SignOutState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
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
                        ...bloc.userReservations.map(
                          (res) => ReservationCard(
                              roomId: '${res.roomId}',
                              nights: '${res.numNights}',
                              date: res.date,
                              onPressed: () => _navigateToEdit(context),
                              onDelete: () {
                                context
                                    .read<ProfileBloc>()
                                    .add(RemoveResEvent(reservationId: res.id));
                              }),
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
