import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semester_cup/services/database.dart';
import '../Screens/profile_settings_screen.dart';

import '../Classes/user.dart';

import '../Widgets/profile_tile.dart';
import '../Widgets/photo_circle.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/user-screen';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
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
              onPressed: () {
                Navigator.of(context).pushNamed(ProfileSettingsScreen.routeName,
                    arguments: user);
              }),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DatabaseService(user.uid).getUserData(),
        builder: (context, snapshot) {
          if (snapshot == null) return Text('LOADING');
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                Stack(children: [
                PhotoCircle(snapshot.data.profileImage, () {}),
                  Positioned(
                    bottom: 0,
                    right: 50,
                    child: Text(
                      '3',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  )
                ]),
                
                ProfileTile("Name :", snapshot.data.name),
                ProfileTile("Email:", snapshot.data.email),
                SizedBox(height: 10),
                // ProfileEntires(user.completed),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
