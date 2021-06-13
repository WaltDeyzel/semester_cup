import 'package:flutter/material.dart';

import 'package:semester_cup/Classes/user.dart';
import 'package:semester_cup/Screens/profile_screen.dart';

class LeaderboardTile extends StatelessWidget {
  final user;
  LeaderboardTile(this.user);
  void selectedUserRoute(User user, BuildContext context) {
    Navigator.of(context).pushNamed(ProfileScreen.routeName, arguments: user);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          selectedUserRoute(user, context);
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Theme.of(context).accentColor),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
                  child: user.profileImage == null
                      ? Icon(Icons.account_circle)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            user.profileImage,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
                title: Text(user.name),
                // UNIVERSITY NAME AS SUBTITLE
                subtitle: Text('99'),
                // USER SCORE OVERALL?
                trailing: Text(user.points.toString()),
              ),
            ),
            SizedBox(height: 5)
          ],
        ));
  }
}
