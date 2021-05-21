import 'package:flutter/material.dart';
import 'package:semester_cup/Widgets/photo_circle.dart';
import 'package:semester_cup/Widgets/profile_entries.dart';
import '../Classes/user.dart';
import '../Widgets/profile_tile.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/user-screen';

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments as User;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          user.name,
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Stack(children: [
              PhotoCircle(user.profilePhoto, () {}),
              Positioned(
                  bottom: 0,
                  right: 50,
                  child: Text(user.points.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)))
            ]),
            ProfileTile("Student no:", user.studentNum),
            ProfileTile("Email:", user.email),
            SizedBox(height: 10),
            ProfileEntires(user.completed),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
