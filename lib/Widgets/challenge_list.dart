import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Classes/challenges_demo.dart' show ChallengeListDemo;

class ChallengeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(activeWallets[0].active);
    //final mediaQ = MediaQuery.of(context);
    final challenges = Provider.of<ChallengeListDemo>(context).items;
    return Container(
      color: Theme.of(context).primaryColor,
      //height: 350,
      child: challenges.isEmpty
          ? Text('No Challenges')
          : Column(
              children: <Widget>[
                ...challenges.map((element) {
                  return InkWell(
                    // onTap: (){},
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
