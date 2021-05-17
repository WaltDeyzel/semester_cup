import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semester_cup/Screens/spesific_challange_screen.dart';
import '../Classes/challenges_demo.dart';
import '../Classes/challenge.dart';

class ChallengeList extends StatelessWidget {
  void selectedChallengeRoute(Challenge challenge, BuildContext context) {
    Navigator.of(context)
        .pushNamed(SpesificChallengeScreen.routeName, arguments: challenge);
  }

  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeListDemo>(context).items;
    return Container(
      padding: EdgeInsets.all(10),
      color: Theme.of(context).primaryColor,
      child: challenges.isEmpty
          ? Text('No Challenges')
          : Column(
              children: <Widget>[
                ...challenges.map((element) {
                  return InkWell(
                    onTap: () {
                      selectedChallengeRoute(element, context);
                    },
                    splashColor: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    child: Card(
                      color: Color.fromRGBO(141, 208, 252, 0.8),
                      elevation: 1,
                      child: ListTile(
                        title: Text(
                          element.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
    );
  }
}
