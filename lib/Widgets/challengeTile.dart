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
  static const Color cardsColour = Colors.white;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectedChallengeRoute(_challange, context);
      },
      // STACK EVERYTHING ON THE IMAGE 
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: _challange.coverPhoto == null
                // NETWORK IMAGE IS TEMP. WILL REPLACE WITH DEFAULT IMAGE IF CHALLENGE IMAGE DOES NOT LOAD
                    ? NetworkImage(
                        'https://cdn.mos.cms.futurecdn.net/ntFmJUZ8tw3ULD3tkBaAtf.jpg')
                    : FileImage(_challange.coverPhoto),
              ),
            ),
            child: Center(
              child: info == false
                  // TITLE 
                  ? Card(
                      color: cardsColour,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          _challange.title.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                      ),
                    )
                  // DESCRIPTION
                  : Card(
                      color: cardsColour,
                      margin: EdgeInsets.all(15),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          _challange.description,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
                    ),
            ),
            height: 300,
            width: double.infinity,
          ),
          // ICON BUTTON TO TOGGLE IF DESCRIPTION OR TITLE IS SHOWN
          Positioned(
            right: 0,
            child: IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    print(info);
                    info = !info;
                  });
                }),
          ),
          // AMOUNT OF ENTRIES, VOTES, DEADLINE, PRIZES ETC TYPE OF INFORMATION DISPLAYED AT BOTTOM OF IGAME.
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                    color: cardsColour,
                    child: Container(
                      width: 50,
                      child: Row(
                        children: [
                          Icon(Icons.add_box_outlined),
                          Text(
                            _challange.getNoSubmist().toString(),
                          ),
                        ],
                      ),
                    )),
                Card(
                  color: cardsColour,
                  child: Container(
                    width: 50,
                    child: Row(
                      children: [
                        Icon(Icons.emoji_events_outlined),
                        Text('100'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
