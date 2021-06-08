import 'package:flutter/material.dart';

import '../Screens/profile_settings_screen.dart';

import '../Classes/user.dart';

import '../Widgets/profile_tile.dart';
import '../Widgets/photo_circle.dart';
import '../widgets/profile_entries.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/user-screen';

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments as User;
    print(user);
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
            ),
            onPressed:
                 (){
                  Navigator.of(context).pushNamed(ProfileSettingsScreen.routeName);
                 }
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            // Stack(children: [
            //   //PhotoCircle(user.profilePhoto, () {}),
            //   Positioned(
            //     bottom: 0,
            //     right: 50,
            //     child: Text(
            //       '3',
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //           color: Colors.black),
            //     ),
            //   )
            // ]),
            ProfileTile("Student no:", user.studentNum),
            ProfileTile("Email:", user.email),
            SizedBox(height: 10),
            // ProfileEntires(user.completed),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
