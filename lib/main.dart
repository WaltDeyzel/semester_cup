import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screens/spesific_challange_screen.dart';
import 'Screens/home_screen.dart';
import './Screens/leaderboard_screen.dart';
import './Classes/challenges_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ChallengeListDemo(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserListDemo(),
          ),
        ],
        child: MaterialApp(
          title: 'SemesterCup',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            '/': (ctx) => HomeScreen(),
            ChallengeListScreen.routeName: (ctx) => ChallengeListScreen(),
            LeaderboardScreen.routeName: (ctx) => LeaderboardScreen(),
            SpesificChallengeScreen.routeName: (ctx) => SpesificChallengeScreen(),
          },
        ));
  }
}
