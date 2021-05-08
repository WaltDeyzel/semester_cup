import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './challenge.dart';
import './user.dart';
import 'dart:io';

class ChallengeEntry with ChangeNotifier{
  final String id;
  final Challenge challenge;
  final String pictureURL;
  final File photo;
  final DateTime dateTime;
  int votes;
  final User user;
  bool liked = false;

  ChallengeEntry({
    @required this.id,
    @required this.challenge,
    this.pictureURL,
    @required this.dateTime,
    @required this.votes,
    @required this.user,
    this.photo
  });
}
