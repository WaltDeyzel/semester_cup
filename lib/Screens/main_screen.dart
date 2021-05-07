import 'package:flutter/material.dart';

import '../Widgets/challenge_list.dart';

class MainScreen extends StatefulWidget {
  
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          ChallengeList(),
        ],),
      ),
    );
  }
}