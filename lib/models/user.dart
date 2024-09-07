class User {
  final String username;
  final String password;
  final String email;
  bool isLogged = false;

  User({
    required this.username,
    required this.password,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      email: json['email'],
    );
  }

  toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
    };
  }

  static getUsers() {
    List users = [
      {
        'username': 'ahmed',
        'password': '123',
        'email': 'ahmed@gmail.com',
      },
      {
        'username': 'fahad',
        'password': '123',
        'email': 'fahad@gmail.com',
      }
    ];
    return users;
  }
}
