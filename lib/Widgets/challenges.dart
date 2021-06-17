import 'package:flutter/material.dart';
import 'package:semester_cup/services/database.dart';

import '../Widgets/challengeTile.dart';

class Challenges extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DatabaseService database = DatabaseService('');
    return FutureBuilder(
      future: database.getChallenges2,
      initialData: [],
      builder: (context, challenge) {
      return ListView.builder(
        itemCount: challenge.data.length,
        itemBuilder: (context, index) {
          print(challenge.data[index].id);
          return ChallangeTile(challenge.data[index]);
        },
      );
    });
  }
}
