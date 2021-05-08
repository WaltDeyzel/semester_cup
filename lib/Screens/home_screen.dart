import 'package:flutter/material.dart';
import 'package:semester_cup/Screens/user_screen.dart';

import './challenge_list_screen.dart';
import './leaderboard_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final List<Widget> _pages = [ChallengeListScreen(), LeaderboardScreen()];
  int _pageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
    //how to pass user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.emoji_events_outlined),
        title: Text("SemesterCup"),
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.all_inbox), label: ('CHALLENGES')),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events), label: ('LEADERBOARD')),
        ],
      ),
    );
  }
}
