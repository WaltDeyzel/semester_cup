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
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Color.fromRGBO(141, 208, 252, 0.8),
              child: Center(
                  child: Text(
                "LIST OF AVAILABLE CHALLENGES",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
            ),
            ChallengeList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.drive_file_rename_outline),
        onPressed: () => {_addNewChallenge(context)},
      ),
    );
  }
}
