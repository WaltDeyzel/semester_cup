import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semester_cup/Screens/spesific_challange_screen.dart';
import '../Classes/challenges_demo.dart' show ChallengeListDemo;
import '../Classes/challenge.dart';

class ChallengeList extends StatelessWidget {
  void selectedChallengeRoute(Challenge challenge, BuildContext context){
    print('works');
    Navigator.of(context).pushNamed(SpesificChallengeScreen.routeName, arguments: challenge);
  }
  
  @override
  Widget build(BuildContext context) {
    final challenges = Provider.of<ChallengeListDemo>(context).items;
    return Container(
      color: Theme.of(context).primaryColor,
      child: challenges.isEmpty ? Text('No Challenges'): Column(
              children: <Widget>[
                ...challenges.map((element) {
                  return InkWell(
                    onTap: (){selectedChallengeRoute(element, context);},
                    splashColor: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    child: Card(
                      elevation: 1,
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        title: Text(
                          element.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
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
