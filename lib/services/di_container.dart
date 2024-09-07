import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import '../managers/reservation_mgr.dart';
import '../managers/room_mgr.dart';
import '../managers/user_mgr.dart';

class DIContainer {
  static Future<void> setup() async {
    await GetStorage.init();

    GetIt.I.registerSingleton<UserMgr>(UserMgr());
    GetIt.I.registerSingleton<RoomMgr>(RoomMgr());
    GetIt.I.registerSingleton<ReservationMgr>(ReservationMgr());
  }
}
