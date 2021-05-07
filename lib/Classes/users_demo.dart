import 'package:flutter/material.dart';
import './user.dart';

class UserListDemo with ChangeNotifier {
  List<User> _users = [
    User(
      name: 'Lynn',
      studentNum: 'WYNLYN004',
      email: 'WYNLYN004@myuct.ac.za',
      points: 143,
    ),
    User(
      name: 'Walt',
      studentNum: 'WALTINO003',
      email: 'WALTINO@myuct.ac.za',
      points: 97,
    ),
    User(
      name: 'Mentor Chelsea',
      studentNum: 'CHEL001',
      email: 'CHEL@DEVSOC.COM',
      points: 121,
    ),
  ];

  List<User> get users {
    return [..._users];
  }
}
