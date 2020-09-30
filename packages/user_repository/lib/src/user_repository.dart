import 'dart:async';

import 'package:uuid/uuid.dart';

import 'models/models.dart';

class UserRepository {
  User _user;

  List<String> _users = [
    'email1@yo',
    'email2@hi',
  ];

  Future<User> getUserByEmail(String email) async {
    if (_user == email) return _user;
    //if (_users.contains(email)) return _user = User(email);
     return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(email),
    );
  }

  Future<User> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(Uuid().v4()),
    );
  }
}
