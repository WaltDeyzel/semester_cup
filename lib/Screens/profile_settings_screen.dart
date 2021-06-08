import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Classes/user.dart';

import '../Widgets/photo_circle.dart';

// Creating a challange form
class ProfileSettingsScreen extends StatefulWidget {
  static const routeName = "/signUp_screen";
  @override
  _ProfileSettingsScreen createState() => _ProfileSettingsScreen();
}

class _ProfileSettingsScreen extends State<ProfileSettingsScreen> {
  final _form = GlobalKey<FormState>();
  final picker = ImagePicker();
  File _coverPhoto; // COVER PHOTO SELCTED BY USER

  // NEW USER
  var _newUser = User(email: '', name: '', studentNum: '', points: 0);

  // ONCE ALL THE FIELDS ARE FILLED IT WILL BE VALIDATED AND SUBMITTED.
  void _submitData() {
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

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 15),
                // TITLE SELECTION FOR CHALLENGE
                TextFormField(
                  maxLines: 1,
                  maxLength: 15,
                  decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onSaved: (name) {
                    _newUser =
                        User(email: '', name: name, studentNum: '', points: 0);
                  },
                ),
                // SPACING
                SizedBox(height: 5),
                // DESCRIPTION SELECTION FRO CHALLANEG
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Student number",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onSaved: (stdNo) {
                    _newUser = User(
                        email: '',
                        name: _newUser.name,
                        studentNum: stdNo,
                        points: 0);
                  },
                ),
                // SPACING
                SizedBox(height: 15),
                // DATE PICKER
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "email",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  onSaved: (newValue) {
                    _newUser = User(
                        email: '',
                        name: _newUser.name,
                        studentNum: _newUser.studentNum,
                        points: 0);
                  },
                ),
                Container(
                  height: 60,
                  child: TextButton(
                    child: Text(
                      'Submit',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    onPressed: () {
                      _submitData();
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