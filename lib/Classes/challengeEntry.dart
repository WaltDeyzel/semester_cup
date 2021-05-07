import 'dart:ui';

import 'package:flutter/foundation.dart';
import './challenge.dart';
import './user.dart';

class ChallengeEntry {
  final String id;
  final Challenge challenge;
  final Picture picture;
  final DateTime dateTime;
  final int votes;
  final User user;

  ChallengeEntry({
    @required this.id,
    @required this.challenge,
    @required this.picture,
    @required this.dateTime,
    @required this.votes,
    @required this.user,
  });
}
