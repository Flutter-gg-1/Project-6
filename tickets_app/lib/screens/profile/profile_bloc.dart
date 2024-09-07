import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tickets_app/core/all_file.dart';
import 'package:tickets_app/managers/reservation_mgr.dart';
import 'package:tickets_app/managers/room_mgr.dart';
import 'package:tickets_app/model/reservation.dart';

import '../../managers/user_mgr.dart';
import '../../model/room.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  var userMgr = GetIt.I.get<UserMgr>();
  var roomMgr = GetIt.I.get<RoomMgr>();
  var resMgr = GetIt.I.get<ReservationMgr>();
  get currentUser => userMgr.currentUser;
  get userReservations {
    return resMgr.allReservations
        .where((res) => res.userId == currentUser!.id)
        .toList()
      ..sort((a, b) {
        DateTime dateA = a.date
            .toDateTime(); // Use your extension to convert string to DateTime
        DateTime dateB = b.date.toDateTime();
        return dateA.compareTo(dateB); // Sort in ascending order
      });
  }

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    on<RemoveResEvent>(removeEvent);

    on<SignOutEvent>(signOut);

    on<UpdateResListEvent>(updateReservationList);
  }

  FutureOr<void> updateReservationList(
      UpdateResListEvent event, Emitter<ProfileState> emit) {
    emit(UpdateResListState(reservations: userReservations));
  }

  FutureOr<void> removeEvent(
      RemoveResEvent event, Emitter<ProfileState> emit) async {
    await resMgr.removeReservation(reservationId: event.reservationId);

    print('Event Removed');

    // Emit Changes
    emit(UpdateResListState(reservations: userReservations));
  }

  FutureOr<void> signOut(SignOutEvent event, Emitter<ProfileState> emit) async {
    await userMgr.signOut();

    print('Signing out');

    // Emit Changes
    emit(UpdateResListState(reservations: userReservations));
  }

  Room getSelectedRoom(int roomId) {
    var allRooms = roomMgr.allRooms;
    return allRooms.firstWhere((room) => room.id == roomId);
  }
}
