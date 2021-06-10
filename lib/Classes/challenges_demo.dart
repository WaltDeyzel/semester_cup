import 'package:flutter/material.dart';
import './user.dart';
import './challengeEntry.dart';
import './challenge.dart';

class ChallengeListDemo with ChangeNotifier {
  List<Challenge> _items = [
    
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
