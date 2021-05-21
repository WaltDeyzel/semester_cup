import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final info;
  final title;
  ProfileTile(this.title, this.info);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(children: <Widget>[
        Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            info,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ]),
    );
  }
}
