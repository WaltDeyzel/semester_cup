import 'package:flutter/material.dart';

import 'package:semester_cup/Classes/user.dart';
import 'package:semester_cup/Screens/user_screen.dart';

class LeaderboardTile extends StatelessWidget {
  final user;
  LeaderboardTile(this.user);
  void selectedUserRoute(User user, BuildContext context) {
    Navigator.of(context).pushNamed(UserScreen.routeName, arguments: user);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedUserRoute(user, context);
      },
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 1,
        color: Theme.of(context).accentColor,
        child: ListTile(
          title: Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          trailing: Text(
            user.points.toString(),
          ),
        ),
      ),
    );
  }
}
