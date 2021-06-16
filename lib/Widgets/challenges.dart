import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/challengeTile.dart';
import '../Classes/challenge.dart';

class Challenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Challenge> challenges = Provider.of<List<Challenge>>(context);
    return ListView.builder(
      itemCount: challenges.length,
      itemBuilder: (context, index) {
        return ChallangeTile(challenges[index]);
      },
    );
  }
}
