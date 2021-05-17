import 'package:flutter/foundation.dart';
import '../Classes/challengeEntry.dart';

class Challenge with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final List<ChallengeEntry> submits;

  Challenge({
    @required this.id,
    @required this.title,
    @required this.description,
    this.submits,
  });
  
  List<ChallengeEntry> get items {
    return [...submits]; //returns copy of _items into a new list
  }

  void addEntry(ChallengeEntry entry){
    submits.add(entry);
  }
}

