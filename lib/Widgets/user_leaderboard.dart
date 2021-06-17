import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'leaderboard_tile.dart';
import '../Classes/user.dart' as current;

class UserLeaderboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<current.User>>(context);
    //users.sort((a, b) => b.points.compareTo(a.points));
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return LeaderboardTile(users[index]);
      },
    );
  }
}
