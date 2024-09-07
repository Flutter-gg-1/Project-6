import 'package:get_storage/get_storage.dart';
import '../core/extensions/img_ext.dart';
import '../model/user.dart';
import '../utils/box_storage.dart';
import '../utils/img_converter.dart';

class UserMgr {
  final box = GetStorage();
  final String currentUserKey = 'currentUser';
  final String key = 'users';
  List<User> allUsers = [];
  User? currentUser;

  UserMgr() {
    _fetchData();
    _fetchCurrentUser();
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

  // MARK: - Current User

  Future<void> _fetchCurrentUser() async {
    if (box.read(currentUserKey) != null) {
      currentUser = await BoxStorage.readItem(
          key: currentUserKey, fromJson: (json) => User.fromJson(json));
    }
  }

  Future<void> signIn(User user) async {
    currentUser = user;
    await BoxStorage.writeItem(
      item: user,
      key: currentUserKey,
      toJson: (user) => user.toJson(),
    );
  }

  Future<void> signOut() async {
    currentUser = null;
    box.remove(currentUserKey);
  }

  // MARK: - Default Users

  Future<List<User>> _loadDefaultUsers() async {
    return [
      User(
          id: 0,
          name: 'John Doe',
          avatarData: await ImgConverter.assetImgToData(Img.person1),
          email: 'john@example.com',
          password: 'John123@'),
      User(
          id: 1,
          name: 'Jack Sparrow',
          avatarData: await ImgConverter.assetImgToData(Img.person2),
          email: 'jack@example.com',
          password: 'Jack123@'),
      User(
          id: 2,
          name: 'Jane Smith',
          avatarData: await ImgConverter.assetImgToData(Img.person3),
          email: 'jane@example.com',
          password: 'Jane123@'),
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
