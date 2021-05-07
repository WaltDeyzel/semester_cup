import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semester_cup/Classes/users_demo.dart';

class UserLeaderboardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(activeWallets[0].active);
    //final mediaQ = MediaQuery.of(context);
    final users = Provider.of<UserListDemo>(context).users;
    return Container(
      color: Theme.of(context).primaryColor,
      //height: 350,
      child: users.isEmpty
          ? Text('No Users to display')
          : Column(
              children: <Widget>[
                ...users.map((element) {
                  return InkWell(
                    // onTap: (){},
                    splashColor: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    child: Card(
                      elevation: 1,
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        title: Text(
                          element.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        trailing: Text(
                          element.points.toString(),
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
