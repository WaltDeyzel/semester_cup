import 'package:flutter/material.dart';
import './user.dart';

class UserListDemo with ChangeNotifier {
  List<User> _users = [
    User(
      name: 'LynnW',
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
      name: 'Chelsea',
      studentNum: 'CHEL001',
      email: 'CHEL@DEVSOC.COM',
      points: 121,
    ),
    User(
      name: 'Jessica',
      studentNum: 'JESS001',
      email: 'JESS@email.com',
      points: 87,
    ),
    User(
      name: 'Damon',
      studentNum: 'DAMON01',
      email: 'DAMON@email.com',
      points: 83,
    ),
    User(
      name: 'Piero',
      studentNum: 'PIER001',
      email: 'Piero@email.com',
      points: 75,
    ),
    User(
      name: 'Lloyd',
      studentNum: 'LLO001',
      email: 'Lloyd@email.com',
      points: 76,
    ),
    User(
      name: 'Marshall',
      studentNum: 'EMIN001',
      email: 'marshall@mail.com',
      points: 101,
    ),
  ];

  List<User> get users {
    return [..._users];
  }
}
