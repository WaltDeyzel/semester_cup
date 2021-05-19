import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semester_cup/Screens/spesific_challange_screen.dart';

import '../Classes/challenge.dart';
import '../Classes/challenges_demo.dart';
import '../Widgets/challengeTile.dart';

class ChallengeListScreen extends StatefulWidget {
  static const routeName = "/challenge_list_screen";

  @override
  _ChallengeListScreen createState() => _ChallengeListScreen();
}

class _ChallengeListScreen extends State<ChallengeListScreen> {
  void selectedChallengeRoute(Challenge challenge, BuildContext context) {
    Navigator.of(context)
        .pushNamed(SpesificChallengeScreen.routeName, arguments: challenge);
  }

  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeListDemo>(context).items;
    return Scaffold(
      body: ListView.builder(
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          return ChallangeTile(selectedChallengeRoute, challenges[index]);
        },
      ),
    );
  }
}
