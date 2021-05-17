import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:semester_cup/Classes/user.dart';
import 'package:semester_cup/Classes/users_demo.dart';
import 'package:semester_cup/Screens/user_screen.dart';

class UserLeaderboardList extends StatelessWidget {
  void selectedUserRoute(User user, BuildContext context) {
    Navigator.of(context).pushNamed(UserScreen.routeName, arguments: user);
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UserListDemo>(context).users;
    users.sort((a, b) => b.points.compareTo(a.points));
    return Container(
      color: Theme.of(context).primaryColor,
      //height: 350,
      child: users.isEmpty
          ? Text('No Users to display')
          : Column(
              children: <Widget>[
                ...users.map((element) {
                  return InkWell(
                    onTap: () {
                      selectedUserRoute(element, context);
                    },
                    splashColor: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    child: Card(
                      elevation: 1,
                      color: Color.fromRGBO(
                          141, 208, 252, 0.8), //Theme.of(context).primaryColor,
                      child: ListTile(
                        title: Text(
                          element.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
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
