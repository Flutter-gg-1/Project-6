import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
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

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    on<RemoveResEvent>(removeEvent);

    on<SignOutEvent>(signOut);

    on<UpdateResListEvent>(updateReservationList);
  }

  FutureOr<void> updateReservationList(
      UpdateResListEvent event, Emitter<ProfileState> emit) {
    emit(UpdateResListState(reservations: userReservations()));
  }

  FutureOr<void> removeEvent(
      RemoveResEvent event, Emitter<ProfileState> emit) async {
    await resMgr.removeReservation(reservationId: event.reservationId);
    print('Removing Event');
    emit(RemoveResState(reservationId: event.reservationId));
    emit(UpdateResListState(reservations: userReservations()));
  }

  FutureOr<void> signOut(SignOutEvent event, Emitter<ProfileState> emit) async {
    await userMgr.signOut();
    emit(SignOutState());
    emit(UpdateResListState(reservations: userReservations()));
  }

  List<Reservation> userReservations() {
    return currentUser == null
        ? []
        : resMgr.allReservations
            .where((res) => res.userId == currentUser!.id)
            .toList();
  }

  Room getSelectedRoom(int roomId) {
    var allRooms = roomMgr.allRooms;
    return allRooms.firstWhere((room) => room.id == roomId);
  }
}
