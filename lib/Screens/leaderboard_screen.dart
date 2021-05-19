import 'package:flutter/material.dart';
import '../Widgets/user_leaderboard_list.dart';

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
            Container(
              color: Theme.of(context).accentColor,
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  "LEADERBOARD",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            UserLeaderboardList(),
          ],
        ),
      ),
    );
  }
}
