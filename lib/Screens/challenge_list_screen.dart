import 'package:flutter/material.dart';

import '../Widgets/challenge_list.dart';

class ChallengeListScreen extends StatefulWidget {
  static const routeName = "/challenge_list_screen";

  @override
  _ChallengeListScreen createState() => _ChallengeListScreen();
}

class _ChallengeListScreen extends State<ChallengeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ChallengeList(),
          ],
        ),
      ),
    );
  }
}
