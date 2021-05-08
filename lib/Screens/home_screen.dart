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
    //how to pass user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.emoji_events, color: Colors.yellow,),
        title: Text("SemesterCup",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.black,
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
