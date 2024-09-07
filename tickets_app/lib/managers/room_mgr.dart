import 'package:get_storage/get_storage.dart';
import '../core/extensions/img_ext.dart';
import '../model/room.dart';
import '../utils/box_storage.dart';
import '../utils/img_converter.dart';

class RoomMgr {
  final box = GetStorage();
  final String key = 'rooms';
  List<Room> allRooms = [];

  RoomMgr() {
    _fetchData();
  }

  Future<void> _fetchData() async {
    if (box.read(key) == null) {
      allRooms = await _loadDefaultRooms();
      BoxStorage.writeItems(
        items: allRooms,
        key: key,
        toJson: (room) => room.toJson(),
      );
    } else {
    }
  }

  // MARK: - Default Rooms

  Future<List<Room>> _loadDefaultRooms() async {
    return [
      Room(
        id: 0,
        imgData: await ImgConverter.assetImgToData(Img.room1),
        title: 'Single Room',
        description:
            'Cozy and ideal for solo travelers, offering a comfortable bed, modern amenities, and a private bathroom.',
        rating: 3.9,
        price: 100,
      ),
      Room(
        id: 1,
        imgData: await ImgConverter.assetImgToData(Img.room2),
        title: 'Double Room',
        description:
            'Spacious room with two beds, perfect for couples or friends, featuring modern comforts and a relaxing ambiance.',
        rating: 4.6,
        price: 150,
      ),
      Room(
        id: 2,
        imgData: await ImgConverter.assetImgToData(Img.room3),
        title: 'King Suite',
        description:
            'Luxurious suite with a king-sized bed, living area, and premium amenities for a lavish and comfortable stay.',
        rating: 4.1,
        price: 250,
      ),
      Room(
        id: 3,
        imgData: await ImgConverter.assetImgToData(Img.room4),
        title: 'Royal Suite',
        description:
            'Elegant and expansive, offering opulent decor, multiple rooms, and exclusive services for a truly regal experience.',
        rating: 5.0,
        price: 470,
      )
    ];
  }
}
