import 'package:flutter/material.dart';
import 'package:semester_cup/Classes/challengeEntry.dart';

class EntryItemTile extends StatefulWidget {
  final entry;
  EntryItemTile(this.entry);
   @override
  _EntryItemTile createState() => _EntryItemTile(this.entry);
}

class _EntryItemTile extends State<EntryItemTile> {
  ChallengeEntry  entry;
 _EntryItemTile(this.entry);
  @override
  Widget build(BuildContext context) {
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
            //     arguments: product.id);
          },
          child: Image.network(entry.pictureURL, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(icon: Icon(Icons.account_circle), onPressed: () {
          },),
          title: Text(
            "Votes: " + entry.votes.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: !entry.liked ?Icon(Icons.favorite_border_outlined) : Icon(Icons.favorite, color: Colors.red,),
            color: Theme.of(context).accentColor,
            onPressed: () {
              setState(() {
                if(!entry.liked){entry.votes += 1;entry.liked = true;}
                else if(entry.liked){entry.votes -= 1; entry.liked = false;}
                
              });
              
              
            },
          ),
        ),
      ),
    );
  }
}
