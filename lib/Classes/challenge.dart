import 'package:flutter/foundation.dart';
import '../Classes/challengeEntry.dart';
import 'dart:io';

class Challenge with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final File coverPhoto;
  final DateTime deadline;
  final DateTime created;
  final List<ChallengeEntry> submits;

  Challenge({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.deadline,
    @required this.created,
    this.coverPhoto,
    this.submits,
  });
  
  List<ChallengeEntry> get items {
    return [...submits]; //returns copy of _items into a new list
  }

  void addEntry(ChallengeEntry entry){
    submits.add(entry);
  }

  int getNoSubmist(){
    return submits.length;
  }
}

