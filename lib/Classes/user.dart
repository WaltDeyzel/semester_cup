import 'package:flutter/foundation.dart';
import '../Classes/challengeEntry.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String profileImage;
  final int points;
  List<ChallengeEntry> completed;

  User({
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.points,
    this.profileImage,
    this.completed,
  });
}
