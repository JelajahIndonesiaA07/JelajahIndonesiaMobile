class Register {
  late String username;
  late String password1;
  late String password2;

  Register({
    required this.username,
    required this.password1,
    required this.password2,
  });
}

class User {
  String? username;
  String? password1;

  User({
    required this.username,
    required this.password1,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"] == null ? null : json["username"],
        password1: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "password": password1 == null ? null : password1,
      };
}

