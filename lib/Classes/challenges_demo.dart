import 'package:flutter/material.dart';
import './challenge.dart';

class ChallengeListDemo with ChangeNotifier {
  List<Challenge> _items = [
    Challenge(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      
    ),
    Challenge(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      
    ),
    Challenge(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      
    ),
    Challenge(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
    ),
  ];
 
  List<Challenge> get items {
    return [..._items]; //returns copy of _items into a new list
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
