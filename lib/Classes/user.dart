import 'package:flutter/foundation.dart';
import '../Classes/challengeEntry.dart';
import 'dart:io';

class User {
  final String uid;
  final String name;
  final String email;
  final int points;
  String profileImage;
  File profilePhoto;
  
  List<ChallengeEntry> completed;

  User({
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.points,
    this.profileImage,
    this.profilePhoto,
    this.completed,
  });
}
