import 'package:flutter/material.dart';
import './user.dart';
import './challengeEntry.dart';
import './challenge.dart';

class ChallengeListDemo with ChangeNotifier {
  List<Challenge> _items = [
    Challenge(
        id: 'p1',
        title: 'Table mountain selfie',
        description: 'Take a picture with our favorite mountain!',
        submits: [
          ChallengeEntry(
            id: 'entry1',
            challenge: Challenge(
              id: 'c0',
              title: 'table mountain',
              description: 'Take a selfie with you and our favorite mountain!',
            ),
            pictureURL:
                'https://www.tablemountain.net/uploads/files/header_home.jpg',
            dateTime: DateTime.parse("1969-07-20 20:19:04Z"), // 8:19pm
            votes: 8,
            user: User(
              name: 'Walt',
              studentNum: 'WALTINO003',
              email: 'WALTINO@myuct.ac.za',
              points: 80,
            ),
          ),
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
          ChallengeEntry(
            id: 'entry2',
            challenge: Challenge(
              id: 'c2',
              title: 'table mountain',
              description: 'Take a selfie with you and our favorite mountain!',
            ),
            pictureURL:
                'https://www.glenavon.co.za/wp-content/uploads/2017/12/Cape-Town-Attractions-Table-Mountain-View.jpg',
            dateTime: DateTime.parse("1969-07-20 20:18:04Z"), // 8:18pm
            votes: 10,
            user: User(
              name: 'Lynn',
              studentNum: 'WYNLYN004',
              email: 'WYNLYN004@myuct.ac.za',
              points: 100,
            ),
          ),
        ]),
    Challenge(
        id: 'p2',
        title: 'Run away from a UCT pigeon',
        description:
            'a UCT requirement. when visiting campus for your tut/exam.',
        submits: []),
    Challenge(
        id: 'p5',
        title: 'Get coffee from a vending machine',
        description: 'with to much sugar.',
        submits: []),
    Challenge(
        id: 'p6',
        title: 'Feed a starling',
        description: 'the UCT birdies.',
        submits: []),
    Challenge(
        id: 'p4',
        title: 'Blame Eduroam for all your problems',
        description: 'the standard.',
        submits: []),
    Challenge(
        id: 'p4',
        title: 'Solve a Rubik\'s cube',
        description: 'bragging rights.',
        submits: []),
    Challenge(
        id: 'p4',
        title: 'Attend a hackathon',
        description: 'yay for devsoc!',
        submits: []),
    Challenge(
        id: 'p4',
        title: 'Get a UCT hoodie',
        description: 'bragging rights.',
        submits: []),
  ];

  List<Challenge> get items {
    return [..._items]; //returns copy of _items into a new list
  }

  void addChallenge(Challenge add) {
    _items.add(add);
    notifyListeners();
  }

  Challenge findModuleById(String challengetId) {
    return _items.firstWhere((element) => element.id == challengetId);
  }

  void notify() {
    notifyListeners();
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
