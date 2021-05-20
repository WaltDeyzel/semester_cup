import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:semester_cup/Classes/users_demo.dart';
import 'package:semester_cup/Widgets/leaderboard_tile.dart';

class UserLeaderboard extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserListDemo>(context).users;
    users.sort((a, b) => b.points.compareTo(a.points));
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return LeaderboardTile(users[index]);
      },
    );
  }
}
