import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Widgets/add_entry.dart';
import '../Classes/challengeEntry.dart';
import '../Classes/challenge.dart';
import '../Widgets/challenge_entry_grid_view.dart';

class SpesificChallengeScreen extends StatefulWidget {
  static const routeName = '/challenge-info-screen';

  _SpesificChallengeScreen createState() => _SpesificChallengeScreen();
}

class _SpesificChallengeScreen extends State<SpesificChallengeScreen> {
  File _storedImage;
  final picker = ImagePicker();
  Future<void> _addChallengeEntry(Challenge selectedChallenge) async {
    // final imageFile = await ImagePicker.platform
    //     .pickImage(source: ImageSource.gallery, maxWidth: 600, maxHeight: 600);
    final imageFile = await picker.getImage(source: ImageSource.gallery, maxWidth: 600, maxHeight: 600);
    _storedImage = File(imageFile.path);
    showModalBottomSheet(
      context: context,
      builder: (btcx) {
        return GestureDetector(
          onTap: () {},
          // Widget for adding a challange
          child: AddEntry(selectedChallenge, _storedImage),
          behavior: HitTestBehavior.opaque,
        );
      },
      
    );
    setState(() {});
  }

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
          onPressed: (){_addChallengeEntry(selectedChallenge);},
        ),);
  }
}
