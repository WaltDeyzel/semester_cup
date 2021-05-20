import 'package:flutter/material.dart';
import '../Classes/challengeEntry.dart';

class EntryItemTile extends StatefulWidget {
  final entry;
  EntryItemTile(this.entry);
  @override
  _EntryItemTile createState() => _EntryItemTile(this.entry);
}

class _EntryItemTile extends State<EntryItemTile> {
  ChallengeEntry entry;
  _EntryItemTile(this.entry);

  // TOGGLE VOTING FOR ENTRY
  void addLike() {
    setState(() {
      if (!entry.liked) {
        entry.votes += 1;
        entry.liked = true;
      } else if (entry.liked) {
        entry.votes -= 1;
        entry.liked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // _selectedChallengeRoute(_challange, context);
            },
            onDoubleTap: () {
              addLike();
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
                      image: entry.photo == null
                          // NETWORK IMAGE IS TEMP. WILL REPLACE WITH DEFAULT IMAGE IF CHALLENGE IMAGE DOES NOT LOAD
                          ? NetworkImage(entry.pictureURL)
                          : FileImage(entry.photo),
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
                        Icons.account_circle_outlined,
                      ),
                      onPressed: () {
                        // GO TO PROFILE OF USER
                        setState(() {
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
                    addLike();
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
