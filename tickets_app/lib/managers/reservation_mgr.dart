import 'dart:math';
import 'package:get_storage/get_storage.dart';
import '../model/reservation.dart';
import '../utils/box_storage.dart';

class ReservationMgr {
  final box = GetStorage();
  final String key = 'reservations';
  List<Reservation> allReservations = [];

  ReservationMgr() {
    _fetchData();
  }

  Future<void> _fetchData() async {
    if (box.read(key) != null) {
      allReservations = await BoxStorage.readItems<Reservation>(
          key: key, fromJson: (json) => Reservation.fromJson(json));
    }
  }

  Future<void> addReservation({
    required int userId,
    required int roomId,
    required String date,
    required int numNights,
  }) async {
    var reservation = Reservation(
      id: Random().nextInt(999),
      userId: userId,
      roomId: roomId,
      date: date,
      numNights: numNights,
    );
    allReservations.add(reservation);
    await _writeToBox();
  }

  Future<void> removeReservation({required int reservationId}) async {
    var reservation = allReservations
        .where((reservation) => reservation.id == reservationId)
        .firstOrNull;
    if (reservation != null) {
      allReservations.remove(reservation);
      await _writeToBox();
    }
  }

  Future<void> _writeToBox() async {
    await BoxStorage.writeItems(
      items: allReservations,
      key: key,
      toJson: (reservation) => reservation.toJson(),
    );
  }
}
