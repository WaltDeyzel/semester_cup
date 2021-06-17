import 'package:flutter/material.dart';
import '../widgets/user_leaderboard.dart';

class LeaderboardScreen extends StatefulWidget {
  static const routeName = "/leaderboard_screen";
  @override
  _LeaderboardScreen createState() => _LeaderboardScreen();
}

class _LeaderboardScreen extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserLeaderboard(),
    );
  }
}
