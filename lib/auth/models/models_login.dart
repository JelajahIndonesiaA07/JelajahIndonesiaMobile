import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

User customerFromJson(String str) => User .fromJson(json.decode(str));

String customerToJson(User  data) => json.encode(data.toJson());

class Login {
  Login({
    required this.username,
    required this.password1,
  });

  final String? username;
  final String? password1;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        username: json["username"] == null ? null : json["username"],
        password1: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "password": password1 == null ? null : password1,
      };
}

class UserManagement with ChangeNotifier {
  User? _userLoggedIn;

  void setUser(User c) {
    _userLoggedIn = c;
    notifyListeners();
  }

  void removeUser() {
    _userLoggedIn = null;
    notifyListeners();
  }

  User? get userLoggedIn => _userLoggedIn;
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
