import 'package:project6/models/user.dart';

class UsersLayer {
  final List<User> users = [
    User.fromJson({
      'name': 'turki',
      'email': 'turki@',
      'phone': '05456',
      'password': 'turki',
    })
  ];
  late User? currentUser;
}
