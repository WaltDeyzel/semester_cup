import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';

import '../Classes/user.dart';
// import '../Classes/challenges_demo.dart';
import '../Widgets/challengeTile.dart';
import '../Classes/challenge.dart';

class Challenges extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    List<Challenge> chall = Provider.of<List<Challenge>>(context);
    print('here');
    print(chall[1].id);
    return ListView.builder(
      itemCount: chall.length,
      itemBuilder: (context, index) {
        return ChallangeTile(chall[index]);
      },
    );
  }
}
