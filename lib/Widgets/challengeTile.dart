import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import '../Classes/challenge.dart';
import '../Classes/user.dart';
import '../Screens/spesific_challange_screen.dart';
class ChallangeTile extends StatefulWidget {
  //final selectedChallengeRoute;
  final Challenge challenge;
  ChallangeTile(this.challenge);
  @override
  _ChallangeTile createState() =>
      _ChallangeTile(this.challenge);
}

class _ChallangeTile extends State<ChallangeTile> {
  final Challenge _challange;
  _ChallangeTile(this._challange);
  
  void _selectedChallengeRoute(Challenge _challenge, BuildContext context) {
    Navigator.of(context)
        .pushNamed(SpesificChallengeScreen.routeName, arguments: _challenge);
  }

  bool info = false;
  static const Color cardsColour = Colors.white;
  
  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<User>(context).uid;
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
                image: 
                // NETWORK IMAGE IS TEMP. WILL REPLACE WITH DEFAULT IMAGE IF CHALLENGE IMAGE DOES NOT LOAD
                
                    NetworkImage(_challange.coverPhoto),
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
                          style: Theme.of(context).textTheme.headline2,
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
                          style: Theme.of(context).textTheme.headline3,
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
                  color: cardsColour,
                ),
                onPressed: () {
                  setState(() {
                    print(info);
                    info = !info;
                  });
                }),
          ),
          Positioned(
            left: 0,
            child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: cardsColour,
                ),
                onPressed: () {
                  DatabaseService database = DatabaseService(uid);
                  database.deleteChallenge(uid, _challange.id, _challange.coverPhoto);
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
                          //_challange.getNoSubmist().toString(),
                          Text(
                            'fix'
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
