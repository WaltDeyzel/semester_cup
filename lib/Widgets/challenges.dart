import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../Classes/challenges_demo.dart';
import '../Widgets/challengeTile.dart';
import '../Classes/challenge.dart';

class Challenges extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    List<Challenge> chall = Provider.of<List<Challenge>>(context);
    return ListView.builder(
      itemCount: chall.length,
      itemBuilder: (context, index) {
        return ChallangeTile(chall[index]);
      },
    );
  }
}
