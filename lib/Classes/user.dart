import 'package:flutter/foundation.dart';
import 'package:semester_cup/Classes/challenge.dart';

class User {
  final String id;
  final String name;
  final String studentNum;
  final String email;
  final int points;
  List<Challenge> completed = [];

  User({
    @required this.id,
    @required this.name,
    @required this.studentNum,
    @required this.email,
    @required
        this.points, //in later iterations we will make this dynamic. given time constraints we make this static
  });
}
