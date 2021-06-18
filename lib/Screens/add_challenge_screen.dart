import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import '../services/database.dart';

import '../Classes/challenge.dart';
import '../Classes/user.dart';

import '../Widgets/photo_circle.dart';

// Creating a challange form
class AddChallengeScreen extends StatefulWidget {
  static const routeName = "/add_challange_screen";
  @override
  _AddChallengeScreen createState() => _AddChallengeScreen();
}

class _AddChallengeScreen extends State<AddChallengeScreen> {
  final _form = GlobalKey<FormState>();
  final picker = ImagePicker();
  File _coverPhoto; // COVER PHOTO SELCTED BY USER
  DateTime _selectedDate; // DEADLINE FOR THE CHALLANGE. DATE SELECTED
  String dateText = 'Date deadline';

  // THE CHALLENGE THAT WILL BE CREATED. BLANK FOR NOW
  var _newChallenge = Challenge(id: '', created: null, deadline: null, title: '', description: '');

  // ONCE ALL THE FIELDS ARE FILLED IT WILL BE VALIDATED AND SUBMITTED.
  void _submitData(String uid) async {
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
      DatabaseService challengeData = DatabaseService(uid);
      challengeData.addChallenge(_newChallenge, _coverPhoto, uid);
      Navigator.of(context).pop();
    }
  }

  // ALLOWS USER TO SELCET PICTURE FROM GALLERY. CHANGING GALLERY TO CAMERA ALLOWS PHOTO TO BE TAKEN DIRECTLY
  Future<void> _imgFromCamera() async {
    final image = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 480);
    setState(() {
      _coverPhoto = File(image.path);
    });
  }

  // DEPLOY A DATE PICKER TO SELECT A DEADLINE FOR THE CHALLANGE
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2022),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        dateText = DateFormat.yMd().format(_selectedDate);
      });
    }); //returns a future.
  }

  @override
  Widget build(BuildContext context) {
    String uid = Provider.of<User>(context).uid;
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
                  maxLength: 15,
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
                    _newChallenge = Challenge(
                        id: DateTime.now().toString(),
                        created: _newChallenge.created,
                        deadline: _newChallenge.deadline,
                        title: newValue,
                        description: _newChallenge.description);
                  },
                ),
                // SPACING
                SizedBox(height: 5),
                // DESCRIPTION SELECTION FRO CHALLANEG
                TextFormField(
                  maxLines: 5,
                  maxLength: 50,
                  minLines: 1,
                  decoration: InputDecoration(
                    labelText: "Description",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return "Please add a description.";
                    return null;
                  },
                  onSaved: (newValue) {
                    _newChallenge = Challenge(
                        id: _newChallenge.id,
                        title: _newChallenge.title,
                        description: newValue,
                        coverPhoto: '',
                        deadline: _selectedDate,
                        created: DateTime.now(),
                        submits: []);
                  },
                ),
                // DATE PICKER
                Container(
                  height: 60,
                  child: TextButton(
                    child: Text(dateText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    onPressed: _presentDatePicker,
                  ),
                ),
                Container(
                  height: 60,
                  child: TextButton(
                    child: Text('Add Challenge',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    onPressed: () {
                      _submitData(uid);
                    },
                  ),
                ),
                Container(
                  height: 60,
                  child: TextButton(
                    child: Text(
                      'cancel',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
