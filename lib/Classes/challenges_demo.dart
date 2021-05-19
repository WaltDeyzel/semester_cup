import 'package:flutter/material.dart';
import './user.dart';
import './challengeEntry.dart';
import './challenge.dart';

class ChallengeListDemo with ChangeNotifier {
  List<Challenge> _items = [
    Challenge(
        id: 'p1',
       deadline: DateTime.now(),
        created: DateTime.now(),
        // MOUNTAIN -------------------------------------------------
        title: 'Table mountain selfie',
        description: 'Take a picture with our favorite mountain!',
        submits: [
          ChallengeEntry(
            id: 'entry1',
            pictureURL:
                'https://photos.smugmug.com/South-Africa-2017/Cape-Town-Audreys/i-wQnP4j9/0/36268230/L/Cape-Town-5-L.jpg',
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
            pictureURL:
                'https://media-exp1.licdn.com/dms/image/C4D22AQFwZrtvhHKfKg/feedshare-shrink_800/0/1605704066137?e=1621468800&v=beta&t=ArKJUpRjwa26XeHNyw0iJ0f4GbHaNiKhmPIhg4ziwY4',
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
        deadline: DateTime.now(),
        created: DateTime.now(),
        title: 'Run from a UCT pigeon',
        // PIGION ------------------------------------------------- 
        description:
            'a UCT requirement. when visiting campus for your tut/exam.',
        submits: [
          ChallengeEntry(
            id: 'entry2',
            pictureURL: 'https://i.ytimg.com/vi/nSXZcPfgnvE/hqdefault.jpg',
            dateTime: DateTime.parse("1969-07-20 20:18:04Z"), // 8:18pm
            votes: 87,
            user: User(
              name: 'Lynn',
              studentNum: 'WYNLYN004',
              email: 'WYNLYN004@myuct.ac.za',
              points: 100,
            ),
          ),
          ChallengeEntry(
            id: 'entry2',
            pictureURL: 'https://i.redd.it/pv2td453rzn41.jpg',
            dateTime: DateTime.parse("1969-07-20 20:18:04Z"), // 8:18pm
            votes: 23,
            user: User(
              name: 'Lynn',
              studentNum: 'WYNLYN004',
              email: 'WYNLYN004@myuct.ac.za',
              points: 100,
            ),
          ),
        ]),
    Challenge(
        id: 'p4',
        deadline: DateTime.now(),
        created: DateTime.now(),
        title: 'Attend a hackathon',
        description: 'yay for devsoc!',
        submits: []),
    Challenge(
        id: 'p6',
        deadline: DateTime.now(),
        created: DateTime.now(),
        title: 'Sleep in Library',
        description: 'the UCT birdies.',
        submits: []),
    Challenge(
        id: 'p4',
        deadline: DateTime.now(),
        created: DateTime.now(),
        title: 'Solve a Rubik\'s cube',
        description: 'bragging rights.',
        submits: []),
    Challenge(
        id: 'p4',
        deadline: DateTime.now(),
        created: DateTime.now(),
        title: 'Get a UNI hoodie',
        description: 'bragging rights.',
        submits: []),
    Challenge(
        id: 'p6',
        deadline: DateTime.now(),
        created: DateTime.now(),
        title: '2X Lecture videos.',
        description: 'Faste Pase',
        submits: []),
    Challenge(
        id: 'p4',
        deadline: DateTime.now(),
        created: DateTime.now(),
        title: 'Start studying on day of test.',
        description: 'the standard.',
        submits: []),
    Challenge(
        id: 'p5',
        deadline: DateTime.now(),
        created: DateTime.now(),
        title: 'Get coffee from a vending machine',
        description: 'with to much sugar.',
        submits: []),
  ];

  List<Challenge> get items {
    return [..._items]; //returns copy of _items into a new list
  }

  void addChallenge(Challenge add) {
    _items.insert(0, add);
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
