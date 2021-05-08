import 'package:flutter/material.dart';
import './challenge_entry.dart';

class ChallengeEntryGrid extends StatelessWidget {
  final entries;
  ChallengeEntryGrid(this.entries);
  @override
  Widget build(BuildContext context) {
    //setting up a listener.
    //One of parent classes must have a provider. Only this widget will rebuild
  
    return GridView.builder(
      padding: const EdgeInsets.all(5),
      itemCount: entries.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ( // Use .value when dealing with lists or grids. When re using a existing object.
        EntryItemTile(entries[i])
      ),
    );
  }
}
