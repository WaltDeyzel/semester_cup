import 'package:flutter/foundation.dart';
import '../Classes/challengeEntry.dart';

class User {
  final String name;
  final String studentNum; //acts as id
  final String email;
  final int points;
  List<ChallengeEntry> completed = [];

  User({
    @required this.name,
    @required this.studentNum,
    @required this.email,
    @required
        this.points, //in later iterations we will make this dynamic. given time constraints we make this static
  });
}
