import 'package:flutter/material.dart';

import '../Screens/add_challenge_screen.dart';

import '../Widgets/challenges.dart';

class ChallengeListScreen extends StatefulWidget {
  static const routeName = "/challenge_list_screen";

  @override
  _ChallengeListScreen createState() => _ChallengeListScreen();
}

class _ChallengeListScreen extends State<ChallengeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Challenges(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(AddChallengeScreen.routeName);
          }),
    );
  }
}
