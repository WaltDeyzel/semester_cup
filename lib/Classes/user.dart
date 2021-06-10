import 'package:flutter/foundation.dart';
import '../Classes/challengeEntry.dart';

class User {
  final String name;
  final String studentNum;
  final String uid;
  final String email;
  final String profileImage;
  final int points;
  List<ChallengeEntry> completed;

  User({
    @required this.name,
    @required this.email,
    @required this.points,
    this.uid,
    this.studentNum,
    this.profileImage,
    this.completed,
  });
}
