import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Classes/challengeEntry.dart';
import '../Classes/challenge.dart';
import '../Widgets/challenge_entry_grid_view.dart';

class SpesificChallengeScreen extends StatefulWidget {
  static const routeName = '/challenge-info-screen';

  _SpesificChallengeScreen createState() => _SpesificChallengeScreen();
}

class _SpesificChallengeScreen extends State<SpesificChallengeScreen> {
  File _storedImage;
  Future<void> _addChallengeEntry() async {
    final imageFile = await ImagePicker.platform
        .pickImage(source: ImageSource.camera, maxWidth: 600);
  }

  @override
  Widget build(BuildContext context) {
    // Challenge challenge = ModalRoute.of(context).settings.arguments as Challenge;
    Challenge selectedChallenge =
        ModalRoute.of(context).settings.arguments as Challenge;
    List<ChallengeEntry> entries = selectedChallenge.items;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(selectedChallenge.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
        ),
        body: ChallengeEntryGrid(entries),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
          onPressed: _addChallengeEntry,
        ));
  }
}
