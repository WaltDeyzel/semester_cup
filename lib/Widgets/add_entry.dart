import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Classes/challengeEntry.dart';
import '../Classes/challenges_demo.dart';
import '../Classes/challenge.dart';
// Creating a challange entry form
class AddEntry extends StatefulWidget {
  final Challenge selectedChallenge;
  final File photo;
  AddEntry(this.selectedChallenge, this.photo);
  @override
  _AddEntry createState() => _AddEntry(selectedChallenge, photo);
}

class _AddEntry extends State<AddEntry> {
  final Challenge _selectedChallenge;
  final File _photo;
  _AddEntry(this._selectedChallenge, this._photo);
  final _form = GlobalKey<FormState>();
  
  var _newChallenge = ChallengeEntry(id: '');

  void _saveForm(Challenge selectedChallenge) {
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    _form.currentState.save();
    selectedChallenge.addEntry(_newChallenge);
  }

  @override
  Widget build(BuildContext context) {
    
    final challenges = Provider.of<ChallengeListDemo>(context);
    return Container(
      child: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Title", //alot of options
              ),
              validator: (value) {
                if (value.isEmpty) return "Please add a Title.";
                return null;
              },
              onSaved: (newValue) {
                _newChallenge = ChallengeEntry(id: 'qwerty', title: newValue, photo: _photo);
              },
              onFieldSubmitted: (_) {
                _saveForm(_selectedChallenge);
                challenges.notify();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}