import 'dart:io';
import 'package:flutter/material.dart';

import '../Screens/add_entry_screen.dart';

import '../Classes/challengeEntry.dart';
import '../Classes/challenge.dart';
import '../Widgets/challenge_entry_grid_view.dart';

class SpesificChallengeScreen extends StatefulWidget {
  static const routeName = '/challenge-info-screen';

  _SpesificChallengeScreen createState() => _SpesificChallengeScreen();
}

class _SpesificChallengeScreen extends State<SpesificChallengeScreen> {
  File _storedImage;
  
  @override
  Widget build(BuildContext context) {
    //Selected Challange
    Challenge selectedChallenge =
        ModalRoute.of(context).settings.arguments as Challenge;
    // All entries of selected challange
    List<ChallengeEntry> entries = selectedChallenge.items;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            selectedChallenge.title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: _storedImage == null
            // Display all entries in a grid format
            ? ChallengeEntryGrid(entries)
            : Image.file(_storedImage),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.add_a_photo,),
          onPressed: (){
            Navigator.of(context).pushNamed(AddEntryScreen.routeName, arguments: selectedChallenge);
          }
            //_addChallengeEntry(selectedChallenge);},
        ),);
  }
}
