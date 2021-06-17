import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class ChallengeEntry with ChangeNotifier{
  final String id;
  final String title;
  final String pictureURL;
  final File photo;
  final DateTime dateTime;
  int votes;
  bool liked = false;

  ChallengeEntry({
    @required this.id,
    @required this.title,
    @required this.votes,
    this.pictureURL,
    this.dateTime,
    this.photo
  });
}
