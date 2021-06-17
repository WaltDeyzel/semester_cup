import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../services/database.dart';

import '../Classes/challengeEntry.dart';
import '../Classes/challenge.dart';
import '../Classes/user.dart';

import '../Widgets/photo_circle.dart';

// Creating a challange form
class AddEntryScreen extends StatefulWidget {
  static const routeName = "/add_entry_screen";
  @override
  _AddEntryScreen createState() => _AddEntryScreen();
}

class _AddEntryScreen extends State<AddEntryScreen> {
  final _form = GlobalKey<FormState>();
  final picker = ImagePicker();
  File _coverPhoto; // COVER PHOTO SELCTED BY USER
  String dateText = 'Date deadline';

  // THE CHALLENGE THAT WILL BE CREATED. BLANK FOR NOW
  var _newChallengeEntry = ChallengeEntry(id: '', title: '', votes: 0);

  // ONCE ALL THE FIELDS ARE FILLED IT WILL BE VALIDATED AND SUBMITTED.
  void _submitData(String uid, String challengeID) {
    
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    // IF A COVER PHOTO IS NOT SELECTED PROPT USER TO SELECT ONE
    if (_coverPhoto == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Selecte a photo.'),
            );
          });
    } else {
      _form.currentState.save();
      DatabaseService database = DatabaseService(uid);
      database.addEntry(_newChallengeEntry, _coverPhoto, challengeID, uid);
      Navigator.of(context).pop();
    }
  }

  // ALLOWS USER TO SELCET PICTURE FROM GALLERY. CHANGING GALLERY TO CAMERA ALLOWS PHOTO TO BE TAKEN DIRECTLY
  Future<void> _imgFromCamera() async {
    final image =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _coverPhoto = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<User>(context).uid;
    final challenge = ModalRoute.of(context).settings.arguments as Challenge;
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(top: 45),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Form(
              key: _form,
              child: ListView(
                children: <Widget>[
                  // COVER IMAGE DISPLAYED IN THE CENTER OF DEVICE
                  PhotoCircle(_coverPhoto, _imgFromCamera),
                  //JUST FOR SPACING THE CIRCLE AWAY FROM APPBAR
                  SizedBox(
                    height: 15,
                  ),
                  // TITLE SELECTION FOR CHALLENGE
                  TextFormField(
                    maxLines: 1,
                    maxLength: 25,
                    decoration: InputDecoration(
                      labelText: "Title",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) return "Please add a Title.";
                      if (value.contains('@')) return "Do not use @";
                      return null;
                    },
                    onSaved: (newValue) {
                      _newChallengeEntry = ChallengeEntry(
                          id: _newChallengeEntry.id,
                          title: newValue,
                          photo: _coverPhoto,
                          votes: 0);
                    },
                  ),
                  // SPACING
                  SizedBox(height: 5),
                  Container(
                    height: 60,
                    child: TextButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      onPressed: () {
                        _submitData(uid, challenge.id);
                      },
                    ),
                  ),
                  Container(
                    height: 60,
                    child: TextButton(
                      child: Text(
                        'cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
