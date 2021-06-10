import 'package:flutter/material.dart';
import '../Classes/challengeEntry.dart';
import './user.dart';

class ChallengeEntryListDemo with ChangeNotifier {
  //list of challenge entries
  List<ChallengeEntry> _entries = [
    
  ];

  List<ChallengeEntry> get entries {
    return [..._entries];
  }
}
