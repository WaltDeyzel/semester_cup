import 'package:flutter/material.dart';
import './challengeEntry.dart';
import './user.dart';

class UserListDemo with ChangeNotifier {
  List<User> _users = [
  
  ];

  List<User> get users {
    return [..._users];
  }
}
