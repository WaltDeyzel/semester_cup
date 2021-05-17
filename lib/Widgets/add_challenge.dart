import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Classes/challenges_demo.dart';
import '../Classes/challenge.dart';
// Creating a challange form
class AddChallenge extends StatefulWidget {
  // final String id;
  // AddChallenge(this.id);
  @override
  _AddChallenge createState() => _AddChallenge();
}

class _AddChallenge extends State<AddChallenge> {
  final _form = GlobalKey<FormState>();

  var _newChallenge = Challenge(id: '', title: '', description: '');

  void _saveForm(ChallengeListDemo challenge) {
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    _form.currentState.save();
    challenge.addChallenge(_newChallenge);
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
                _newChallenge = Challenge(id: 'id', title: newValue, description: _newChallenge.description);
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
                _newChallenge = Challenge(id: 'id', title: _newChallenge.title, description: newValue, submits: []);
              },
              onFieldSubmitted: (_) {
                _saveForm(challenges);
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
