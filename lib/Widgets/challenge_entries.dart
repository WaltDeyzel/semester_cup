import 'package:flutter/material.dart';
import '../services/database.dart';

import 'challenge_entry.dart';

class ChallengeEntries extends StatelessWidget {
  final selectedChallengeID;
  ChallengeEntries(this.selectedChallengeID);

  @override
  Widget build(BuildContext context) {
    DatabaseService database = DatabaseService(selectedChallengeID);
    return FutureBuilder(
        future: database.getEntires,
        initialData: [],
        builder: (context, entry) {
          return ListView.builder(
            itemCount: entry.data.length,
            itemBuilder: (context, index) {
              return EntryItemTile(entry.data[index]);
            },
          );
        });
  }
}
