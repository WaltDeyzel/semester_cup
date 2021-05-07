import 'package:flutter/material.dart';
import 'package:semester_cup/Widgets/user_leaderboard_list.dart';

class LeaderboardScreen extends StatefulWidget {
  static const routeName = "/leaderboard_screen";
  @override
  _LeaderboardScreen createState() => _LeaderboardScreen();
}

class _LeaderboardScreen extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserLeaderboardList(),
          ],
        ),
      ),
    );
  }
}
