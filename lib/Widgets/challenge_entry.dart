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
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          // Open photo on tap and visit user profile.
          onTap: () {
            // Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
            //     arguments: product.id);
          },
          //URL will be temporary I think.
          child: entry.photo != null
              ? Image.file(entry.photo, fit: BoxFit.cover)
              : Image.network(entry.pictureURL),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
          title: Text(
            "Votes: " + entry.votes.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: !entry.liked
                ? Icon(Icons.favorite_border_outlined)
                : Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              setState(() {
                print(entry.votes);
                if (!entry.liked) {
                  entry.votes += 1;
                  entry.liked = true;
                } else if (entry.liked) {
                  entry.votes -= 1;
                  entry.liked = false;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
