import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:project6/models/movie.dart';
import 'package:project6/models/user.dart';

class UsersLayer {

  final List<User> users = [];
  User? currentUser;

  final usersBox = GetStorage();
  
  UsersLayer(){
    // usersBox.erase();
    // load all users
    loadAllUsers();
    // load current user "if exist"
    loadCurrentUser();
  }

  List<Movie> fromListToMovies(List someList) {
    // cast from list of dynamic to list of map
    List<dynamic> userMoviesAsListofDynamic = someList.cast<Map<String,dynamic>>();
    // cast from list of map to list of movie
    return userMoviesAsListofDynamic.map((movie)=>Movie.fromJson(movie)).toList();
  }

  void addUser({required User user}) {
    users.add(
      User(
        name: user.name,
        email: user.email,
        password: user.password,
        phone: user.phone,
        userMovies: user.userMovies
      )
    );
    usersBox.write('users', users);
  }

  void loadAllUsers() {
    List? allUsers = usersBox.read('users');
    if(allUsers != null) {
      for(var u in allUsers) {
        List<Movie> loadedUserMovies = fromListToMovies(u['userMovies']);
        users.add(
          User(
            name: u['name'],
            email: u['email'],
            phone: u['phone'],
            password: u['password'],
            userMovies: loadedUserMovies
          )
        );
      }
      log(users.map((user)=>[user.email, user.password]).toList().toString());
    }
  }

  void loadCurrentUser() {
    Map<String,dynamic>? userAsJson = usersBox.read('currentUser'); // like hasData but stored in var
    if(userAsJson != null) {
      if(userAsJson['userMovies'] != null) {
        // set current user
        currentUser = User(
          name: userAsJson['name'],
          email: userAsJson['email'],
          phone: userAsJson['phone'],
          password: userAsJson['password'],
          userMovies: fromListToMovies(userAsJson['userMovies'])
        );
      }
      else {
        currentUser = User.fromJson(userAsJson);
      }
    }
    else {
      currentUser = null;
    }
    log(currentUser?.name ?? 'No user');
  }

  void login({required User user}) {
    currentUser = user;
    usersBox.write('currentUser', user);
  }

  void signOut() {
    usersBox.write('currentUser', null);
  }
}