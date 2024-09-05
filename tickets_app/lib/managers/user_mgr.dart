import 'package:get_storage/get_storage.dart';
import '../core/extensions/img_ext.dart';
import '../model/user.dart';
import '../utils/box_storage.dart';
import '../utils/img_converter.dart';

class UserMgr {
  final box = GetStorage();
  final String key = 'users';
  List<User> allUsers = [];

  UserMgr() {
    _fetchData();
  }

  Future<void> _fetchData() async {
    if (box.read(key) == null) {
      allUsers = await _loadDefaultUsers();
      await _writeToBox();
    } else {
      allUsers = await BoxStorage.readItems<User>(
          key: key, fromJson: (json) => User.fromJson(json));
    }
  }

  // MARK: - Default Users

  Future<List<User>> _loadDefaultUsers() async {
    return [
      User(
          id: 0,
          name: 'John Doe',
          avatarData: await ImgConverter.assetImgToData(Img.person1),
          email: 'john@example.com',
          password: '123'),
      User(
          id: 1,
          name: 'Jack Sparrow',
          avatarData: await ImgConverter.assetImgToData(Img.person2),
          email: 'jack@example.com',
          password: '123'),
      User(
          id: 2,
          name: 'Jane Smith',
          avatarData: await ImgConverter.assetImgToData(Img.person3),
          email: 'jane@example.com',
          password: '123'),
    ];
  }

  // MARK: Add User
  Future<void> addUser(User user) async {
    allUsers.add(user);
    await _writeToBox();
  }

  Future<void> _writeToBox() async {
    await BoxStorage.writeItems(
      items: allUsers,
      key: key,
      toJson: (user) => user.toJson(),
    );
  }
}
