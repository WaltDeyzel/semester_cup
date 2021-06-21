import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semester_cup/services/database.dart';

import '../Classes/challengeEntry.dart';
import '../Classes/user.dart';

class EntryItemTile extends StatefulWidget {
  final entry;
  final challengeID;
  EntryItemTile(this.entry, this.challengeID);
  @override
  _EntryItemTile createState() => _EntryItemTile(this.entry, this.challengeID);
}

class _EntryItemTile extends State<EntryItemTile> {
  ChallengeEntry entry;
  String challengeID;
  _EntryItemTile(this.entry, this.challengeID);
  DatabaseService database = DatabaseService('');

  // TOGGLE VOTING FOR ENTRY
  void addLike(String entryID, String uid, String challengeID) {
    setState(() {
      if (!entry.liked) {
        entry.votes += 1;
        database.updateVote(entry.id, 1, uid, challengeID);
        entry.liked = true;
      } else if (entry.liked) {
        entry.votes -= 1;
        database.updateVote(entry.id, -1, uid, challengeID);
        entry.liked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<User>(context).uid;
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // _selectedChallengeRoute(_challange, context);
            },
            onDoubleTap: () {
              addLike(entry.id, uid, challengeID);
            },
            // STACK EVERYTHING ON THE IMAGE
            child: Stack(
              children: [
                // DISPLAY ENTRY IMAGE
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0.5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: 
                          // NETWORK IMAGE IS TEMP. WILL REPLACE WITH DEFAULT IMAGE IF CHALLENGE IMAGE DOES NOT LOAD
                          NetworkImage(entry.pictureURL)
                          
                    ),
                  ),
                  height: 300,
                  width: double.infinity,
                ),
                // ICON TO NAVIGATE TO USER PROFILE
                Positioned(
                  right: 0,
                  child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: () {
                        // GO TO PROFILE OF USER
                        setState(() {
                          
                          database.deleteChallengeEntry(uid, challengeID, entry.id);
                          // print(info);
                          // info = !info;
                        });
                      }),
                ),
              ],
            ),
          ),
          // OTHER INFORMATION SUCH AS TITLE AND AMOUNT OF VOTES
          Container(
            height: 40,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: !entry.liked
                      ? Icon(Icons.favorite_border)
                      : Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    addLike(entry.id, uid, challengeID);
                  },
                ),
                Text(
                  entry.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  child: Row(
                    children: [
                      Icon(Icons.emoji_events_outlined),
                      Text(entry.votes.toString()),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
