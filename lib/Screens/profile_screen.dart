import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(child:Column(
        children: [
          SizedBox(height: 15),
          Center(
            child: GestureDetector(
              onTap: () {
                //_imgFromCamera();
              },
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Theme.of(context).primaryColor,
                child: user.profilePhoto != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          user.profilePhoto,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          ProfileTile("Student no:", user.studentNum),
          ProfileTile("Email address:", user.email),
          ProfileTile('Votes', user.points.toString()),
          ProfileEntires(user.completed),
          SizedBox(height:10),
        ],
      ),
    ),);
  }
}
