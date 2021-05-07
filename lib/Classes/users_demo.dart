import 'package:flutter/material.dart';
import './user.dart';

class UserListDemo with ChangeNotifier {
  List<User> _users = [
    User(
      name: 'Lynn',
      studentNum: 'WYNLYN004',
      email: 'WYNLYN004@myuct.ac.za',
      points: 100,
    ),
    User(
      name: 'Walt',
      studentNum: 'WALTINO003',
      email: 'WALTINO@myuct.ac.za',
      points: 80,
    ),
    User(
      name: 'Mentor Chels',
      studentNum: 'CHEL001',
      email: 'CHEL@DEVSOC.COM',
      points: 150,
    ),
  ];

  List<User> get users {
    return [..._users];
  }
}
