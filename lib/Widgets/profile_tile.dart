import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final info;
  final title;
  ProfileTile(this.title, this.info);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.symmetric(vertical: 3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[200],
      ),
      child: ListTile(
        leading: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        title: Text(
          info,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
