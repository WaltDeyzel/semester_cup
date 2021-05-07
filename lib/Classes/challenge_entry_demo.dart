import 'package:flutter/material.dart';
import 'package:semester_cup/Classes/challengeEntry.dart';

import './user.dart';

import './challenge.dart';

class ChallengeEntryListDemo with ChangeNotifier {
  //list of challenge entries
  List<ChallengeEntry> _entries = [
    ChallengeEntry(
      id: 'entry0',
      challenge: Challenge(
        id: 'c0',
        title: 'table mountain',
        description: 'Take a selfie with you and our favorite mountain!',
      ),
      pictureURL:
          'https://cdn.getyourguide.com/img/location/546c82dc2cb7e.jpeg/88.jpg',
      dateTime: DateTime.parse("1969-07-20 20:18:04Z"), // 8:18pm
      votes: 10,
      user: User(
        name: 'Lynn',
        studentNum: 'WYNLYN004',
        email: 'WYNLYN004@myuct.ac.za',
        points: 100,
      ),
    ),
//////////
    ChallengeEntry(
      id: 'entry1',
      challenge: Challenge(
        id: 'c0',
        title: 'table mountain',
        description: 'Take a selfie with you and our favorite mountain!',
      ),
      pictureURL: 'https://www.tablemountain.net/uploads/files/header_home.jpg',
      dateTime: DateTime.parse("1969-07-20 20:19:04Z"), // 8:19pm
      votes: 8,
      user: User(
        name: 'Walt',
        studentNum: 'WALTINO003',
        email: 'WALTINO@myuct.ac.za',
        points: 80,
      ),
    ),
  ];

  List<ChallengeEntry> get entries {
    return [..._entries]; //returns copy of _items into a new list
  }

  // List<Challenge> get favoriteItems{
  //   return _items.where((item) => item.isFavorite).toList();
  // }

  // Challenge findbyId(String id){
  //   return _items.firstWhere((item) => item.id == id);
  // }

  // void addProduct() {
  //   notifyListeners();
  // }
}
