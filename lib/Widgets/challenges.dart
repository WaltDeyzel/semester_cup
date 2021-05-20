import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Classes/challenges_demo.dart';
import '../Widgets/challengeTile.dart';

class Challenges extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeListDemo>(context).items;
    return ListView.builder(
      itemCount: challenges.length,
      itemBuilder: (context, index) {
        return ChallangeTile(challenges[index]);
      },
    );
  }
}
