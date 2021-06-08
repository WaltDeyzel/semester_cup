import 'package:flutter/material.dart';
import '../services/authentication.dart';

import '../Screens/profile_screen.dart';
import './challenge_list_screen.dart';
import './leaderboard_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  final _user;
  HomeScreen(this._user);
  _HomeScreen createState() => _HomeScreen(_user);
}

class _HomeScreen extends State<HomeScreen> {
  final _user;
  _HomeScreen(this._user);
  final AuthService _auth = AuthService();
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.emoji_events, color: Colors.yellow),
          onPressed: () async {
            _auth.signOut();
          },
        ),
        title: Text(
          "SemesterCup",
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).accentColor,
        actions: [
          IconButton(
              icon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ProfileScreen.routeName, arguments: _user);
              }),
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
