class User {
  int id;
  String name;
  String avatarData;
  String email;
  String password;

  User({
    required this.id,
    required this.name,
    required this.avatarData,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      avatarData: json['avatarData'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatarData': avatarData,
        'email': email,
        'password': password
      };
}
