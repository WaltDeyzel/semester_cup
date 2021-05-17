import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './user.dart';
import 'dart:io';

class ChallengeEntry with ChangeNotifier{
  final String id;
  final String title;
  final String pictureURL;
  final File photo;
  final DateTime dateTime;
  int votes;
  final User user;
  bool liked = false;

  ChallengeEntry({
    @required this.id,
    this.title,
    this.pictureURL,
    this.dateTime,
    this.votes,
    this.user,
    this.photo
  });
}
