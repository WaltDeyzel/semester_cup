import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semester_cup/Screens/spesific_challange_screen.dart';
import '../Classes/challenges_demo.dart';
import '../Classes/challenge.dart';
import '../Widgets/challengeTile.dart';

class ChallengeList extends StatelessWidget {
  void selectedChallengeRoute(Challenge challenge, BuildContext context) {
    Navigator.of(context)
        .pushNamed(SpesificChallengeScreen.routeName, arguments: challenge);
  }

  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeListDemo>(context).items;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(0),
      //color: Theme.of(context).primaryColor,
      child: challenges.isEmpty
          ? Text('No Challenges')
          : Column(
              children: <Widget>[
                ...challenges.map((challange) {
                  return ChallangeTile(selectedChallengeRoute, challange);
                }).toList(),
              ],
            ),
    );
  }
}
