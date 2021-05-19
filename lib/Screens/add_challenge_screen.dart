import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Classes/challenges_demo.dart';
import '../Classes/challenge.dart';

// Creating a challange form
class AddChallengeScreen extends StatefulWidget {
  static const routeName = "/add_challange_screen";
  @override
  _AddChallengeScreen createState() => _AddChallengeScreen();
}

class _AddChallengeScreen extends State<AddChallengeScreen> {
  final _form = GlobalKey<FormState>();
  File _coverPhoto;

  var _newChallenge = Challenge(id: '', title: '', description: '');

  final picker = ImagePicker();
  void _saveForm(ChallengeListDemo challenges) {
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    _form.currentState.save();
    challenges.addChallenge(_newChallenge);
  }

  Future<void> _imgFromCamera() async {
    final image =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _coverPhoto = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeListDemo>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    _imgFromCamera();
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xffFDCF09),
                    child: _coverPhoto != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              _coverPhoto,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Title", //alot of options
                ),
                validator: (value) {
                  if (value.isEmpty) return "Please add a Title.";
                  return null;
                },
                onSaved: (newValue) {
                  _newChallenge = Challenge(
                      id: 'id',
                      title: newValue,
                      description: _newChallenge.description);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Description",
                ),
                validator: (value) {
                  if (value.isEmpty) return "Please add a description.";
                  return null;
                },
                onSaved: (newValue) {
                  _newChallenge = Challenge(
                      id: 'id',
                      title: _newChallenge.title,
                      description: newValue,
                      coverPhoto: _coverPhoto,
                      submits: []);
                },
                onFieldSubmitted: (_) {
                  if (_coverPhoto == null) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Selecte a photo.'),
                          );
                        });
                  } else {
                    _saveForm(challenges);
                    challenges.notify();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
