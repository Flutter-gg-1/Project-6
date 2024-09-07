import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tickets_app/managers/reservation_mgr.dart';

import '../../managers/user_mgr.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  var userMgr = GetIt.I.get<UserMgr>();
  var resMgr = GetIt.I.get<ReservationMgr>();
  get currentUser => userMgr.currentUser;
  get userReservations =>
      resMgr.allReservations..where((res) => res.userId == currentUser!.id);

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    on<RemoveResEvent>(removeEvent);

    on<SignOutEvent>(signOut);
  }

  FutureOr<void> removeEvent(
      RemoveResEvent event, Emitter<ProfileState> emit) async {
    await resMgr.removeReservation(reservationId: event.reservationId);
    emit(RemoveResState(reservationId: event.reservationId));
    // Emit Changes
    emit(RemoveResState(reservationId: event.reservationId));
    print('Event Removed');
  }

  FutureOr<void> signOut(SignOutEvent event, Emitter<ProfileState> emit) async {
    await userMgr.signOut();
    // Emit Changes
    emit(SignOutState());
    print('Signing out');
  }
}
