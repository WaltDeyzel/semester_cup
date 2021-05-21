import 'package:flutter/foundation.dart';
import '../Classes/challengeEntry.dart';
import 'dart:io';

class User {
  final String name;
  final String studentNum; //acts as id
  final String email;
  final File profilePhoto;
  final int points;
  List<ChallengeEntry> completed;

  User({
    @required this.name,
    @required this.studentNum,
    @required this.email,
    this.profilePhoto,
    @required
        this.points, //in later iterations we will make this dynamic. given time constraints we make this static
    this.completed,
  });
}
