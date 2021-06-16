import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'challenge_entry.dart';
import '../Classes/challengeEntry.dart';

class ChallengeEntries extends StatelessWidget {
  final selectedChallengeID;
  ChallengeEntries(this.selectedChallengeID);
  @override
  Widget build(BuildContext context) {
    
    final List<ChallengeEntry> entries = Provider.of<List<ChallengeEntry>>(context);
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index){
        return EntryItemTile(entries[index]);
      },
    );
  }
}
