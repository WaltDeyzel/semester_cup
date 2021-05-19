import 'package:flutter/material.dart';
import './challenge_entry.dart';

class ChallengeEntryGrid extends StatelessWidget {
  final entries;
  ChallengeEntryGrid(this.entries);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(0),
      //color: Theme.of(context).primaryColor,
      child: entries.isEmpty
          ? Text('No Challenges')
          : Column(
              children: <Widget>[
                ...entries.map((entry) {
                  return EntryItemTile(entry);
                }).toList(),
              ],
            ),
    );
  }
}
