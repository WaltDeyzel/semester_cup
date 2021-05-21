import 'package:flutter/material.dart';

import './challenge_list_screen.dart';
import './leaderboard_screen.dart';
import './profile_screen.dart';

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
        leading: Icon(
          Icons.emoji_events,
          color: Colors.yellow,
        ),
        title: Text(
          "SemesterCup",
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).accentColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              color: Theme.of(context).primaryColor,
            ),
            onPressed:
                () {}, //{Navigator.of(context).pushNamed(ProfileScreen.routeName, arguments: )
          ),
        ],
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
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
