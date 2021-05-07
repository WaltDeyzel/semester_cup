import 'package:flutter/material.dart';
import '../Classes/challenge.dart';

class SpesificChallengeScreen extends StatelessWidget {
  static const routeName = '/challenge-info-screen';

  @override
  Widget build(BuildContext context) {
    Challenge challenge = ModalRoute.of(context).settings.arguments as Challenge;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text(challenge.title),),
      body: Column(children: <Widget>[

        Center(child:Text('ALL ENTRIES OF PEOPLE')),
      ],),
    );
  }
}