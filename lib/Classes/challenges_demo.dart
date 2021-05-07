import 'package:flutter/material.dart';
import './challenge.dart';

class ChallengeListDemo with ChangeNotifier {
  List<Challenge> _items = [
    Challenge(
      id: 'p1',
      title: 'Table mountain selfie',
      description: 'Take a picture with our favorite mountain!',
    ),
    Challenge(
      id: 'p2',
      title: 'Run away from a UCT pigeon',
      description: 'a UCT requirement. when visiting campus for your tut/exam.',
    ),
    Challenge(
      id: 'p3',
      title: 'Help Lynn',
      description: 'Cause Walt wont do it for me .',
    ),
    Challenge(
      id: 'p4',
      title: 'Say "HECTIC" at the supermarket',
      description: 'a UCT proverb.',
    ),
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
