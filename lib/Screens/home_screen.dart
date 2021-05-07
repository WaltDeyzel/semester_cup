import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_rounded), label: ('Walt')),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_rounded), label: ('Walt'))
        ],
      ),
    );
  }
}
