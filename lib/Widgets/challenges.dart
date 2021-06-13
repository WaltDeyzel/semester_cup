import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/challengeTile.dart';
import '../Classes/challenge.dart';

class Challenges extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final challenge = Provider.of<List<Challenge>>(context);
    
    return ListView.builder(
      itemCount: challenge.length,
      itemBuilder: (context, index) {
        return ChallangeTile(challenge[index]);
      },
    );
  }
}
