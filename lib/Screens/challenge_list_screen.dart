import 'package:flutter/material.dart';

import '../Widgets/challenge_list.dart';
import 'add_challenge_screen.dart';

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
            //Container is just for Text "LIST OF AVAILABLE CHALLENGES."
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).accentColor,
              child: Center(
                  child: Text(
                "LIST OF AVAILABLE CHALLENGES",
                style: Theme.of(context).textTheme.headline3,
              )),
            ),
            // Display all the available challanges. 
            ChallengeList(),
          ],
        ),
      ),
      // Button allows user to add a challange. 
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.drive_file_rename_outline),
        onPressed: () => {
         Navigator.of(context).pushNamed(AddChallengeScreen.routeName)
        }
      ),
    );
  }
}
