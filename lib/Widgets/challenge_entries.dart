import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'challenge_entry.dart';
import '../Classes/challengeEntry.dart';
import '../Classes/challenges_demo.dart';
class ChallengeEntries extends StatelessWidget {
  final selectedChallengeID;
  ChallengeEntries(this.selectedChallengeID);
  @override
  Widget build(BuildContext context) {
    final selectedChallenge = Provider.of<ChallengeListDemo>(context).findModuleById(selectedChallengeID);
    final List<ChallengeEntry> entries = selectedChallenge.items;
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index){
        return EntryItemTile(entries[index]);
      },
    );
  }
}
