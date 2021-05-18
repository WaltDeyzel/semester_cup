import 'package:flutter/material.dart';
import '../Classes/challenge.dart';

class ChallangeTile extends StatefulWidget {
  final selectedChallengeRoute;
  final challange;
  ChallangeTile(this.selectedChallengeRoute, this.challange);
  @override
  _ChallangeTile createState() =>
      _ChallangeTile(this.selectedChallengeRoute, this.challange);
}

class _ChallangeTile extends State<ChallangeTile> {
  final _selectedChallengeRoute;
  final Challenge _challange;
  _ChallangeTile(this._selectedChallengeRoute, this._challange);
  bool info = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectedChallengeRoute(_challange, context);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: _challange.coverPhoto == null
                    ? NetworkImage(
                        'https://cdn.mos.cms.futurecdn.net/ntFmJUZ8tw3ULD3tkBaAtf.jpg')
                    : FileImage(_challange.coverPhoto),
              ),
            ),
            child: Center(
              child: info == false
                  ? Card(
                    color: Colors.white54,
                      child: Text(_challange.title.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black)))
                  : Card(
                      margin: EdgeInsets.all(15),
                      child: Text(
                        _challange.description,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
            ),
            height: 300,
            width: double.infinity,
          ),
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                setState(() {
                  print(info);
                  info = !info;
                });
              }),
          Container(
            margin: EdgeInsets.only(top: 260),
            // color: Color.fromRGBO(255, 255, 255, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                    color: Colors.grey,
                    child: Container(
                      width: 50,
                      child: Row(
                        children: [
                          Icon(Icons.add_box_outlined),
                          Text(_challange.getNoSubmist().toString()),
                        ],
                      ),
                    )),
                Card(
                    color: Colors.grey,
                    child: Container(
                      width: 50,
                      child: Row(
                        children: [
                          Icon(Icons.emoji_events_rounded),
                          Text('100'),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
