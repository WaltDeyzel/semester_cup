import 'package:flutter/material.dart';


class EntryItemTile extends StatelessWidget {
  final entry;
  EntryItemTile(this.entry);
  
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
          title: Text(
            entry.votes.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: !entry.liked ?Icon(Icons.favorite_border_outlined) : Icon(Icons.favorite),
            color: Theme.of(context).accentColor,
            onPressed: () {
              if(!entry.liked)entry.votes += 1;
              entry.liked = true;
              
            },
          ),
        ),
      ),
    );
  }
}
