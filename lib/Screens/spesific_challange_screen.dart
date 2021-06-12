import 'package:flutter/material.dart';

import '../Screens/add_entry_screen.dart';

import '../Classes/challenge.dart';
import '../Widgets/challenge_entries.dart';

class SpesificChallengeScreen extends StatelessWidget {
  static const routeName = '/challenge-info-screen';

  @override
  Widget build(BuildContext context) {
    //Selected Challange
    Challenge selectedChallenge =
        ModalRoute.of(context).settings.arguments as Challenge;
    // All entries of selected challange

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          selectedChallenge.title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Text('NO'),//ChallengeEntries(selectedChallenge.id),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.add_a_photo),
          onPressed: () {
            Navigator.of(context).pushNamed(AddEntryScreen.routeName,
                arguments: selectedChallenge);
          }),
    );
  }
}
