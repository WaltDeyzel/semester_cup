import 'package:flutter/material.dart';

import '../Widgets/challenge_list.dart';
import '../Widgets/add_challenge.dart';

class ChallengeListScreen extends StatefulWidget {
  static const routeName = "/challenge_list_screen";

  @override
  _ChallengeListScreen createState() => _ChallengeListScreen();
}

class _ChallengeListScreen extends State<ChallengeListScreen> {
  void _addNewChallenge(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (btcx) {
        return GestureDetector(
          onTap: () {},
          child: AddChallenge(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        onPressed: () => {_addNewChallenge(context)},
      ),
    );
  }
}
